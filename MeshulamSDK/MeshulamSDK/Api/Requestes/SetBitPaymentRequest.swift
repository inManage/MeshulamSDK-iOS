//
//  setBitPaymentRequest.swift
//  MeshulamSDK
//
//  Created by Inmanage LTD on 23/06/2021.
//

import Foundation

class SetBitPaymentRequest : MeshulamBaseRequest {
    public override func createResponseFromJSONDict(JSONDict: Dict) -> MeshulamBaseServerResponse? {
        let response = SetBitPaymentResponse()
        return  MeshulamBaseServerResponse.initFromJSONDict(JSONDict:JSONDict, withInnerResponse: response)
    }
    
    public static func createSetBitPaymentParams() -> Dict {
        var initialDictParams = [String:Any]()
        let applicationToken = MeshulamNetworkManager.shared.applicationToken
        if !applicationToken.isEmpty {
            initialDictParams.updateValue(applicationToken, forKey: ServerParamNames.applicationToken)
        }
        
        let bitPaymentId = MeshulamPaymentManager.shared.createPaymentProcess?.bitPaymentId
        initialDictParams.updateValue(bitPaymentId ?? "", forKey: ServerParamNames.bitPaymentId)
        return initialDictParams
    }
    
    public override var requestName: String {
        get {
            return ServerRequests.setBitPayment
        }
    }
}
