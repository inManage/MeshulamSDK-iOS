//
//  SettleSuspendedTransactionRequest.swift
//  MeshulamSDK
//
//  Created by Inmanage LTD on 23/06/2021.
//

import Foundation

class SettleSuspendedTransactionRequest: MeshulamBaseRequest {
    public override func createResponseFromJSONDict(JSONDict: Dict) -> MeshulamBaseServerResponse? {
        let response = SettleSuspendedTransactionResponse()
        return  MeshulamBaseServerResponse.initFromJSONDict(JSONDict:JSONDict, withInnerResponse: response)
    }
    
    public static func createSettleSuspendedTransactionDictParams() -> Dict {
        var initialDictParams = [String:Any]()
        let applicationToken = MeshulamNetworkManager.shared.applicationToken
        if !applicationToken.isEmpty {
            initialDictParams.updateValue(applicationToken, forKey: ServerParamNames.applicationToken)
        }
        
        let sum = Meshulam.shared().sum
        if !sum.isEmpty {
            initialDictParams.updateValue(sum, forKey: ServerParamNames.sum)
        }
        
        let userId = Meshulam.shared().userId.aesEncrypt()
        if !userId.isEmpty {
            initialDictParams.updateValue(userId, forKey: ServerParamNames.userId)
        }
        
        let apiKey = Meshulam.shared().apiKey.aesEncrypt()
        if !apiKey.isEmpty {
            initialDictParams.updateValue(apiKey, forKey: ServerParamNames.apiKey)
        }
        
        let transactionId = Meshulam.shared().transactionId
        if !apiKey.isEmpty {
            initialDictParams.updateValue(transactionId, forKey: ServerParamNames.transactionId)
        }

        return initialDictParams
    }
    
    public override var requestName: String {
        get {
            return ServerRequests.settleSuspendedTransaction
        }
    }
}
