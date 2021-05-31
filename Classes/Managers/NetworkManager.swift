//
//  RequestManager.swift
//  MeshulamSDK
//
//  Created by Inmanage LTD on 26/05/2021.
//

import Foundation
import Alamofire

public typealias Dict = [String: Any]

public class NetworkManager: NSObject {
    
    public static let shared = NetworkManager()
    
    private var baseURL = "https://plusecure.meshulam.co.il/api/light/iphone/1.0/"
    
    public func sendRequest(_ request: BaseRequest) {
        
        let headers   : HTTPHeaders      = [HeadersRequest.token: HeadersRequest.inmangaSecure]
        let urlRequest: String           = "\(baseURL)\(request.requestName)/"
        
        let afRequest = AF.request(urlRequest, method: .post, parameters: request.dictParams, headers: headers).validate()
        LogMsg("Full Path:\(logHelper)\(urlRequest)\nParams:\(logHelper)\(request.dictParams)")
        
        request.increaseRequestAttemptsCounter()
    
        afRequest.responseJSON { (result) in
            
            switch result.result {
            case .success(_):
                if let response = result.value as? Dict {
                    LogMsg("Server Response:\(logHelper)\(result.value ?? "")")
                    let outerResponse = request.createResponseFromJSONDict(JSONDict: response)
                    
                    if outerResponse?.responseStatus == .statusSuccess {
                        self.handleSuccessForRequest(request, outerResponse!)
                    }
                    else if outerResponse?.responseStatus == .statusFailure {
                        self.handleFailureForRequest(request, outerResponse!)
                    }
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
        if sendRequestAgain {
            self.perform(#selector(self.sendReqSelector(params:)), with: [ServerRequests.request:request], afterDelay: 0.1)
        }
    }
    
    private func handleSuccessForRequest(_ request: BaseRequest,_ serverResponse: BaseServerResponse) {
        if let delegate = request.requestFinishedDelegate {
            delegate.requestSucceeded(request: request, response: serverResponse.innerResponse)
        }
    }
    
    private func handleFailureForRequest(_ request: BaseRequest,_ serverResponse: BaseServerResponse) {
        if let delegate = request.requestFinishedDelegate {
            delegate.requestFailed(request: request, response: serverResponse)
        }
    }
}



