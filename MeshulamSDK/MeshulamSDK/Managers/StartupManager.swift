//
//  StartupManager.swift
//  MeshulamSDK
//
//  Created by Inmanage LTD on 26/05/2021.
//

import Foundation

protocol StartupManagerDelegate: NSObject {
    func initSDKFailed(error: Error)
}

public class StartupManager  {
    
    public static var shared = StartupManager()
    weak var delegate: StartupManagerDelegate?
    
    public func callInitSDK(requestFinishDelegate: RequestFinishedProtocol? = nil) {
        PaymentManager.shared.isTappedOnExitBtn = false
        let delegate   = requestFinishDelegate == nil ? self : requestFinishDelegate
        let parameters = InitSDKRequest.createInitialDictParams()
        let request    = InitSDKRequest().initWithDictParams(parameters, delegate)
        NetworkManager.shared.sendRequest(request)
    }
  
    private func handleInitSDKResponse(_ response: InitSDKResponse) {
        NetworkManager.shared.fillWithInitSDKResponse(response)
//        NetworkManager.shared.startModeling()
        PaymentManager.shared.callCreatePaymentProcess()
    }
}

extension StartupManager: RequestFinishedProtocol {
    public func requestSucceeded(request: BaseRequest, response: BaseInnerResponse) {
        let requestName = request.requestName
        if requestName == ServerRequests.initSDK {
            handleInitSDKResponse(response as! InitSDKResponse)
        }
    }
    
    public func requestFailed(request: BaseRequest, response: BaseServerResponse?) {
        if let response = response {
            let error = Error(id: response.errorResponse.id, errorMessage: response.errorResponse.message)
            self.delegate?.initSDKFailed(error: error)
        }
    }
}


