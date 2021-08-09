//
//  RequestManager.swift
//  MeshulamSDK
//
//  Created by Inmanage LTD on 26/05/2021.
//

import Foundation
import Alamofire
import UIKit

protocol NetworkManagerDelegate: NSObject {
    func callBackFromEroorPopup()
}

public class NetworkManager: NSObject {
    
    public static let shared = NetworkManager()
    
    public private(set) var baseURL: String = "https://plusecure.meshulam.co.il/"
    public private(set) var applicationToken: String = ""
    public private(set) var maxTime : Int = 0
    public private(set) var startDelay : Int = 0
    public private(set) var intervalLength: Int = 0
    private var timer = Timer()
    
    weak var delegate: NetworkManagerDelegate?
    
    public func sendRequest(_ request: BaseRequest) {
        
        let headers   : HTTPHeaders  = [HeadersRequest.token: HeadersRequest.inmangaSecure]
        let urlRequest: String       = "\(baseURL)\(defaultPath)\(request.requestName)/"
        
        let afRequest = AF.request(urlRequest, method: .post, parameters: request.dictParams, headers: headers).validate()
       
        LogMsg("Full Path:\(logHelper)\(urlRequest)\nParams:\(logHelper)\(request.dictParams)")
        
        request.increaseRequestAttemptsCounter()
    
        afRequest.responseJSON { (result) in
            
            switch result.result {
            case .success(_):
              
                if let response = result.value as? Dict {
                    
                    let outerResponse = request.createResponseFromJSONDict(JSONDict: response)
                    
                    request.responseJson = "\(result.value ?? "")"
                    
                    if outerResponse?.responseStatus == .statusSuccess {
                        self.handleSuccessForRequest(request, outerResponse!)
                    }
                    else if outerResponse?.responseStatus == .statusFailure {
                        self.handleFailureForRequest(request, outerResponse!)
                    }
                    LogMsg("Server Response:\(logHelper)\(result.value ?? "")")
                }
                break
            case .failure(_):
                
                if let error = result.error {
                    LogMsg(error)
                    self.handleAFnetworkingFailure(request)
                }
            }
        }
    }

    @objc func sendReqSelector(params: Dict) {
        guard let request = params[ServerRequests.request] as? BaseRequest  else { return }
        self.sendRequest(request)
    }
    
    private func handleAFnetworkingFailure(_ request: BaseRequest) {
        let sendRequestAgain = request.shouldAttemptSendingRequestAgain()
        sendRequestAgain ? handleSendRequestAgain(request) : handleFailureForRequest(request)
    }
    
    private func handleSendRequestAgain(_ request: BaseRequest) {
        perform(#selector(self.sendReqSelector(params:)), with: [ServerRequests.request:request], afterDelay: 0.1)
    }
    
    private func handleSuccessForRequest(_ request: BaseRequest,_ serverResponse: BaseServerResponse) {
        if let delegate = request.requestFinishedDelegate {
            delegate.requestSucceeded(request: request, response: serverResponse.innerResponse)
        }
    }
    
    private func handleFailureForRequest(_ request: BaseRequest,_ serverResponse: BaseServerResponse? = nil) {
        if let delegate = request.requestFinishedDelegate {
            delegate.requestFailed(request: request, response: serverResponse ?? nil)
        }
        if request.showErrorMsg {
            PopupManager.shared.pushPopup(strTitle: serverResponse?.failureMessage, strFirstBtn: ButtonsTitle.okBtn) {
                callBackStatus in
                
                switch callBackStatus {
                case .exitTap: self.delegate?.callBackFromEroorPopup()
                    break
                    
                case .firstBtnTap: self.delegate?.callBackFromEroorPopup()
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
    }
    
    
    public func startModeling() {
    
//        DispatchQueue.main.async {
//            print("startModeling")
//            self.timer = Timer.scheduledTimer(timeInterval: TimeInterval(0.1), target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
//        }
    }
    
    @objc func update() {
//        print("update")
//
//        DispatchQueue.main.async {
//            if(self.maxTime > 0) {
//                self.maxTime -= self.intervalLength
//                print(self.maxTime)
//            } else {
//                print("time end")
//                self.timer.invalidate()
//            }
//        }
        
    }
}



