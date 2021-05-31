//
//  CreatePaymentProcessRequest.swift
//  MeshulamSDK
//
//  Created by Inmanage LTD on 31/05/2021.
//

import Foundation

class CreatePaymentProcessRequest: BaseRequest {
    
    public override func createResponseFromJSONDict(JSONDict: Dict) -> BaseServerResponse? {
        let response = CreatePaymentProcessResponse()
        return  BaseServerResponse.initFromJSONDict(JSONDict:JSONDict, withInnerResponse: response)
    }
    
    public static func createPaymentProcessDictParams() -> Dict {
        var initialDictParams = [String:Any]()
        
        let applicationToken = NetworkManager.shared.applicationToken
        if !applicationToken.isEmpty {
            initialDictParams.updateValue(applicationToken, forKey: ServerParamNames.applicationToken)
        }
        
        let pageCode = Meshulam.shared.pageCode
        if !pageCode.isEmpty {
            initialDictParams.updateValue(pageCode, forKey: ServerParamNames.pageCode)
        }
        
        let userId = Meshulam.shared.userId
        if !userId.isEmpty {
            initialDictParams.updateValue(userId, forKey: ServerParamNames.userId)
        }
        
        let apiKey = Meshulam.shared.apiKey
        if !apiKey.isEmpty {
            initialDictParams.updateValue(apiKey, forKey: ServerParamNames.apiKey)
        }
        
        return initialDictParams
    }
    
    public override var requestName: String {
        get {
            return ServerRequests.createPaymentProcess
        }
    }
    
}
