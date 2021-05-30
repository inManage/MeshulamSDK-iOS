//
//  InitSDKRequest.swift
//  MeshulamSDK
//
//  Created by Inmanage LTD on 26/05/2021.
//

import Foundation

class InitSDKRequest: BaseRequest {
    
    override func createResponseFromJSONDict(JSONDict: Dictionary<String, Any>) -> BaseOuterResponse? {
        let response = InitSDKResponse()
        
        return  BaseOuterResponse.initFromJSONDict(JSONDict:JSONDict, withInnerResponse: response)
    }
    
}
