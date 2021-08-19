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
    
    public override var requestName: String {
        get {
            return ServerRequests.getBitPaymentStatus
        }
    }
}
