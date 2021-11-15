//
//  RequestManager.swift
//  MeshulamSDK
//
//  Created by Inmanage LTD on 26/05/2021.
//

import Foundation
import UIKit

protocol NetworkManagerDelegate: NSObject {
    func destorySDK()
}

public class MeshulamNetworkManager: NSObject {

    public static let shared = MeshulamNetworkManager()

//    public private(set) var baseURL: String = "https://dev.meshulam.co.il/"
    public private(set) var baseURL: String = "https://plusecure.meshulam.co.il/"
    public private(set) var applicationToken: String = ""
    public private(set) var maxTime : Int = 0
    public private(set) var startDelay : Int = 0
    public private(set) var intervalLength: Int = 0
    private var timeAddingTimeStemp : TimeInterval!
    public var timer = Timer()
    private var callSetBitPaymentSend = false
    
    weak var delegate: NetworkManagerDelegate?
    
    public func sendRequest(_ request: MeshulamBaseRequest) {
        let urlRequest: String       = "\(baseURL)\(defaultPath)\(request.requestName)/"
        
        let url = URL(string: urlRequest)!
        var requestSession = URLRequest(url: url)
        requestSession.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        requestSession.httpMethod = "POST"
        let headers: [String: String] = [HeadersRequest.token: HeadersRequest.inmangaSecure]
        requestSession.allHTTPHeaderFields = headers
        requestSession.httpBody = request.dictParams.percentEncoded()
        request.increaseRequestAttemptsCounter()
        
        let task = URLSession.shared.dataTask(with: requestSession) { data, response, error in
            
            DispatchQueue.main.async {
                if error != nil {
                    self.handleAFnetworkingFailure(request)
                }
                
                if let data = data {
                    if let jsonString = try? JSONSerialization.jsonObject(with: data, options: []) as! Dict {
                        let outerResponse = request.createResponseFromJSONDict(JSONDict: jsonString)
                        
                        request.responseJson = "\(jsonString)"
                        
                        if outerResponse?.responseStatus == .statusSuccess {
                            self.handleSuccessForRequest(request, outerResponse!)
                        }
                        else if outerResponse?.responseStatus == .statusFailure {
                            self.handleFailureForRequest(request, outerResponse!)
                        }
                        LogMsg("Server Response:\(logHelper)\(jsonString)")
                    }
                }
            }
        }
        task.resume()
    }

    @objc func sendReqSelector(params: Dict) {
        guard let request = params[ServerRequests.request] as? MeshulamBaseRequest  else { return }
        self.sendRequest(request)
    }
    
    private func handleAFnetworkingFailure(_ request: MeshulamBaseRequest) {
        let sendRequestAgain = request.shouldAttemptSendingRequestAgain()
        sendRequestAgain ? handleSendRequestAgain(request) : handleFailureForRequest(request)
    }
    
    private func handleSendRequestAgain(_ request: MeshulamBaseRequest) {
        perform(#selector(self.sendReqSelector(params:)), with: [ServerRequests.request:request], afterDelay: 0.1)
    }
    
    private func handleSuccessForRequest(_ request: MeshulamBaseRequest,_ serverResponse: MeshulamBaseServerResponse) {
        if let delegate = request.requestFinishedDelegate {
            delegate.requestSucceeded(request: request, response: serverResponse.innerResponse)
        }
    }
    
    private func handleFailureForRequest(_ request: MeshulamBaseRequest,_ serverResponse: MeshulamBaseServerResponse? = nil) {
        if let delegate = request.requestFinishedDelegate {
            delegate.requestFailed(request: request, response: serverResponse ?? nil)
        }
        if request.showErrorMsg {
            MeshulamPopupManager.shared.pushPopup(strTitle: serverResponse?.failureMessage, strFirstBtn: ButtonsTitle.okBtn) {
                callBackStatus in
                
                switch callBackStatus {
                case .exitTap: self.delegate?.destorySDK()
                    break
                    
                case .firstBtnTap: self.delegate?.destorySDK()
                    break
                    
                case .secondBtnTap: break
                }
            }
        }
    }

    public func fillWithInitSDKResponse(_ response: InitSDKResponse) {
        baseURL = response.hostURL
        maxTime = response.maxTime
        startDelay = response.startDelay
        intervalLength = response.intervalLength
        applicationToken = response.applicationToken
        startModeling(response)
    }
    
    private func startModeling(_ initSDKresonse: InitSDKResponse) {
        timeAddingTimeStemp = Date().addingTimeInterval(TimeInterval((initSDKresonse.maxTime))).timeIntervalSince1970
        timer = Timer.scheduledTimer(timeInterval: TimeInterval(initSDKresonse.intervalLength), target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
    }
    
    @objc public func update() {
        if Date().timeIntervalSince1970 < timeAddingTimeStemp! {
            if !callSetBitPaymentSend {
                MeshulamPaymentManager.shared.callGetBitPaymentStatusRequest(requestFinishDelegate: self)
            }
        } else {
            stopModeling()
        }
    }
    
    private func stopModeling() {
        timer.invalidate()
        Meshulam.shared().delegate?.onFailure("timeout error")
        delegate?.destorySDK()
    }
}

extension MeshulamNetworkManager: MeshulamRequestFinishedProtocol {
    public func requestSucceeded(request: MeshulamBaseRequest, response: BaseInnerResponse) {
        let requestName = request.requestName
        switch requestName {
        case ServerRequests.getBitPaymentStatus:
            if let res = response as? GetBitPaymentStatusResponse {
                
                switch res.paymentStatus ?? .panding {
                case PaymentStatusOptions.success:
                    timer.invalidate()
                    if !callSetBitPaymentSend {
                        MeshulamPaymentManager.shared.callSetBitPaymentRequest()
                        callSetBitPaymentSend = true
                    }
                    break
                case PaymentStatusOptions.failed:
                    stopModeling()
                    break
                case PaymentStatusOptions.panding:
                    break
                }
            }
        default: break
        }
    }
    
    public func requestFailed(request: MeshulamBaseRequest, response: MeshulamBaseServerResponse?) {
       
    }
}

extension Dictionary {
    func percentEncoded() -> Data? {
        return map { key, value in
            let escapedKey = "\(key)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            let escapedValue = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            return escapedKey + "=" + escapedValue
        }
        .joined(separator: "&")
        .data(using: .utf8)
    }
}

extension CharacterSet {
    static let urlQueryValueAllowed: CharacterSet = {
        let generalDelimitersToEncode = ":#[]@" // does not include "?" or "/" due to RFC 3986 - Section 3.4
        let subDelimitersToEncode = "!$&'()*+,;="

        var allowed = CharacterSet.urlQueryAllowed
        allowed.remove(charactersIn: "\(generalDelimitersToEncode)\(subDelimitersToEncode)")
        return allowed
    }()
}
