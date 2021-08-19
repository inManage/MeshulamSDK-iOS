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

public class MeshulamStartupManager  {
    
    public static var shared = MeshulamStartupManager()
    weak var delegate: StartupManagerDelegate?
    
    public func callInitSDK(requestFinishDelegate: MeshulamRequestFinishedProtocol? = nil) {
        MeshulamPaymentManager.shared.isTappedOnExitBtn = false
        let delegate   = requestFinishDelegate == nil ? self : requestFinishDelegate
        let parameters = InitSDKRequest.createInitialDictParams()
        let request    = InitSDKRequest().initWithDictParams(parameters, delegate)
        MeshulamNetworkManager.shared.sendRequest(request)
    }
  
    private func handleInitSDKResponse(_ response: InitSDKResponse) {
        MeshulamNetworkManager.shared.fillWithInitSDKResponse(response)
        MeshulamPaymentManager.shared.callCreatePaymentProcess()
    }
}

extension MeshulamStartupManager: MeshulamRequestFinishedProtocol {
    public func requestSucceeded(request: MeshulamBaseRequest, response: BaseInnerResponse) {
        let requestName = request.requestName
        if requestName == ServerRequests.initSDK {
            handleInitSDKResponse(response as! InitSDKResponse)
        }
    }
    
    public func requestFailed(request: MeshulamBaseRequest, response: MeshulamBaseServerResponse?) {
        if let response = response {
            let error = Error(id: response.errorResponse.id, errorMessage: response.errorResponse.message)
            self.delegate?.initSDKFailed(error: error)
        }
    }
}


