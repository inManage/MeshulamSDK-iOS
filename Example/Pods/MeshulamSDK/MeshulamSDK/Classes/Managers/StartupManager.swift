//
//  StartupManager.swift
//  MeshulamSDK
//
//  Created by Inmanage LTD on 26/05/2021.
//

import Foundation

public class StartupManager  {
    
    static let shared = StartupManager()
    
    public func callInitSDK(requestFinishDelegate: RequestFinishedProtocol? = nil) {
        let delegate   = requestFinishDelegate == nil ? self : requestFinishDelegate
        let parameters = InitSDKRequest.createInitialDictParams()
        let request    = InitSDKRequest().initWithDictParams(parameters, delegate)
        NetworkManager.shared.sendRequest(request)
    }
  
}

extension StartupManager: RequestFinishedProtocol {
    public func requestFailed(request: BaseRequest, response: BaseServerResponse?) {
        if let response = response {
            let error = Error(id: response.errorResponse.id, errorMessage: response.errorResponse.message)
            Meshulam.shared.delegate?.onFailure(error)
        }
    }
    
    public func requestSucceeded(request: BaseRequest, response: BaseInnerResponse) {
        if request.requestName == ServerRequests.initSDK {
            let response = response as! InitSDKResponse
            NetworkManager.shared.fillWithInitSDKResponse(response)
            PaymentManager.shared.callCreatePaymentProcess()
        }
    }
}


