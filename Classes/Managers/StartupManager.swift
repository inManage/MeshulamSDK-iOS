//
//  StartupManager.swift
//  MeshulamSDK
//
//  Created by Inmanage LTD on 26/05/2021.
//

import Foundation

public class StartupManager  {
    
    static let shared = StartupManager()
    
    public func callInitSDK(_ dictParams: Dict, requestFinishDelegate: RequestFinishedProtocol? = nil ) {
        let delegate  = requestFinishDelegate == nil ? self : requestFinishDelegate
        let parameters = [ServerParamNames.udid: "uiuiuiui"]
        let request    = InitSDKRequest().initWithDictParams(parameters, delegate)
        NetworkManager.shared.sendRequest(request)
    }
}

extension StartupManager: RequestFinishedProtocol {
    public func requestSucceeded(request: BaseRequest, response: BaseInnerResponse) {
        if request.requestName == ServerRequests.initSDK {
            if let response = response as? InitSDKResponse {
                print(response.hostURL)
            }
        }
    }
    
    public func requestFailed(request: BaseRequest, response: BaseServerResponse) {
        //
    }
}


