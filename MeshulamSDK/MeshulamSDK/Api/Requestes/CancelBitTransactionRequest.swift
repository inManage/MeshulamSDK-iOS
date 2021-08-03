//
//  CancelBitTransactionRequest.swift
//  MeshulamSDK
//
//  Created by Inmanage LTD on 03/08/2021.
//

import Foundation

class CancelBitTransactionRequest: BaseRequest {
    public override func createResponseFromJSONDict(JSONDict: Dict) -> BaseServerResponse? {
        let response = CancelBitTransactionResponse()
        return  BaseServerResponse.initFromJSONDict(JSONDict:JSONDict, withInnerResponse: response)
    }
    
    public static func createCancelBitTransactionParams() -> Dict {
        var initialDictParams = [String:Any]()
        
        let applicationToken = NetworkManager.shared.applicationToken
        if !applicationToken.isEmpty {
            initialDictParams.updateValue(applicationToken, forKey: ServerParamNames.applicationToken)
        }
        
        let pageCode = Meshulam.shared().pageCode.aesEncrypt()
        if !pageCode.isEmpty {
            initialDictParams.updateValue(pageCode, forKey: ServerParamNames.pageCode)
        }
        
        let processId = Meshulam.shared().processId
        if !processId.isEmpty {
            initialDictParams.updateValue(processId, forKey: ServerParamNames.processId)
        }
        
        
        let processToken = Meshulam.shared().processToken
        if !processToken.isEmpty {
            initialDictParams.updateValue(processToken, forKey: ServerParamNames.processToken)
        }
        
        return initialDictParams
    }
    
    public override var requestName: String {
        get {
            return ServerRequests.cancelBitTransaction
        }
    }
}
