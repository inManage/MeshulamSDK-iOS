//
//  DoPaymentResponse.swift
//  MeshulamSDK
//
//  Created by Inmanage LTD on 23/06/2021.
//

import Foundation

class DoPaymentResponse: BaseInnerResponse {
    
    var url = ""
    var bitPaymentId = ""
    
    public override func buildFromJSONDict(JSONDict: Dict) -> BaseInnerResponse {
        super.buildFromJSONDict(JSONDict: JSONDict)
             
        let getString = MeshulamParseValidator.getStringForKey.self
        url = getString("application_link", JSONDict,  "")
        bitPaymentId = getString("bit_payment_id", JSONDict, "")
        
        return self
    }
}
