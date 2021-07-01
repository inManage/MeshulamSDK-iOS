//
//  SettleSuspendedTransactionRequest.swift
//  MeshulamSDK
//
//  Created by Inmanage LTD on 23/06/2021.
//

import Foundation

class SettleSuspendedTransactionRequest: BaseRequest {
    public override func createResponseFromJSONDict(JSONDict: Dict) -> BaseServerResponse? {
        let response = SettleSuspendedTransactionResponse()
        return  BaseServerResponse.initFromJSONDict(JSONDict:JSONDict, withInnerResponse: response)
    }
    
    public static func createInitialDictParams() -> Dict {
        var initialDictParams = [String:Any]()
        // add params to dictionary params
        return initialDictParams
    }
    
    public override var requestName: String {
        get {
            return ServerRequests.settleSuspendedTransaction
        }
    }
}
