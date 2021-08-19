//
//  GetBitPaymentStatusRequest.swift
//  MeshulamSDK
//
//  Created by Inmanage LTD on 22/06/2021.
//

import Foundation

class GetBitPaymentStatusRequest: MeshulamBaseRequest {
    public override func createResponseFromJSONDict(JSONDict: Dict) -> MeshulamBaseServerResponse? {
        let response = GetBitPaymentStatusResponse()
        return  MeshulamBaseServerResponse.initFromJSONDict(JSONDict:JSONDict, withInnerResponse: response)
    }
    
    public static func createBitPaymentStatusDictParams() -> Dict {
        var dictParams = [String:Any]()
        
        let applicationToken = MeshulamNetworkManager.shared.applicationToken
        if !applicationToken.isEmpty {
            dictParams.updateValue(applicationToken, forKey: ServerParamNames.applicationToken)
        }
        
        let bitPaymentId = MeshulamPaymentManager.shared.createPaymentProcess?.bitPaymentId
        dictParams.updateValue(bitPaymentId ?? "", forKey: ServerParamNames.bitPaymentId)
        
        return dictParams
    }
    
    public override var requestName: String {
        get {
            return ServerRequests.getBitPaymentStatus
        }
    }
}
