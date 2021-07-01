//
//  GetBitPaymentStatusResponse.swift
//  MeshulamSDK
//
//  Created by Inmanage LTD on 22/06/2021.
//

import Foundation

class GetBitPaymentStatusResponse: BaseInnerResponse {
    
    var paymentStatus: PaymentStatusOptions? = .none
    
    public override func buildFromJSONDict(JSONDict: Dict) -> BaseInnerResponse {
        super.buildFromJSONDict(JSONDict: JSONDict)
        
        let getInt = ParseValidator.getIntForKey.self
        
        paymentStatus = PaymentStatusOptions(rawValue: getInt("payment_status", JSONDict, 0))
        
        return self
    }
}
