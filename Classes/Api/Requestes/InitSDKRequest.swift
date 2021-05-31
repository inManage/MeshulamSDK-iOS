//
//  InitSDKRequest.swift
//  MeshulamSDK
//
//  Created by Inmanage LTD on 26/05/2021.
//

import Foundation

public class InitSDKRequest: BaseRequest {
    
    public override func createResponseFromJSONDict(JSONDict: Dict) -> BaseServerResponse? {
        let response = InitSDKResponse()
        return  BaseServerResponse.initFromJSONDict(JSONDict:JSONDict, withInnerResponse: response)
    }
    
    public override var requestName: String {
        get {
            return ServerRequests.initSDK
        }
    }
}

