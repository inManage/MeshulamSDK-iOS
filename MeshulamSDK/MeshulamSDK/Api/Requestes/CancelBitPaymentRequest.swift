//
//  CancelBitPaymentRequest.swift
//  MeshulamSDK
//
//  Created by Inmanage LTD on 23/06/2021.
//

import Foundation

class CancelBitPaymentRequest: BaseRequest {
    public override func createResponseFromJSONDict(JSONDict: Dict) -> BaseServerResponse? {
        let response = CancelBitPaymentResponse()
        return  BaseServerResponse.initFromJSONDict(JSONDict:JSONDict, withInnerResponse: response)
    }
    
    public static func createCancelBitPaymentParams() -> Dict {
        var initialDictParams = [String:Any]()
        
        let applicationToken = NetworkManager.shared.applicationToken
        if !applicationToken.isEmpty {
            initialDictParams.updateValue(applicationToken, forKey: ServerParamNames.applicationToken)
        }
        
        let bitPaymentId = PaymentManager.shared.createPaymentProcess?.bitPaymentId
        initialDictParams.updateValue(bitPaymentId ?? "", forKey: ServerParamNames.bitPaymentId)
        return initialDictParams
    }
    
    public override var requestName: String {
        get {
            return ServerRequests.cancelBitPayment
        }
    }
}
