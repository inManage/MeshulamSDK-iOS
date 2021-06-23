//
//  GetBitPaymentStatusRequest.swift
//  MeshulamSDK
//
//  Created by Inmanage LTD on 22/06/2021.
//

import Foundation

class GetBitPaymentStatusRequest: BaseRequest {
    public override func createResponseFromJSONDict(JSONDict: Dict) -> BaseServerResponse? {
        let response = GetBitPaymentStatusResponse()
        return  BaseServerResponse.initFromJSONDict(JSONDict:JSONDict, withInnerResponse: response)
    }
    
    public static func createInitialDictParams() -> Dict {
        var initialDictParams = [String:Any]()
        // add params to dictionary params
        return initialDictParams
    }
    
    public override var requestName: String {
        get {
            return ServerRequests.getBitPaymentStatus
        }
    }
}
