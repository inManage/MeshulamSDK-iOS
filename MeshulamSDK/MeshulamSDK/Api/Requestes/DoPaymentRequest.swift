//
//  DoPaymentRequest.swift
//  MeshulamSDK
//
//  Created by Inmanage LTD on 23/06/2021.
//

import Foundation

class DoPaymentRequest: BaseRequest {
    public override func createResponseFromJSONDict(JSONDict: Dict) -> BaseServerResponse? {
        let response = DoPaymentResponse()
        return  BaseServerResponse.initFromJSONDict(JSONDict:JSONDict, withInnerResponse: response)
    }
    
    public override var requestName: String {
        get {
            return ServerRequests.doPayment
        }
    }
}
