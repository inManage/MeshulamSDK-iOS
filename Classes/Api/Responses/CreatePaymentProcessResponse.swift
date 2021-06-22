//
//  CreatePaymentProcessResponse.swift
//  MeshulamSDK
//
//  Created by Inmanage LTD on 31/05/2021.
//

import Foundation

public class CreatePaymentProcessResponse: BaseInnerResponse {
    
    var url = ""
    
    public override func buildFromJSONDict(JSONDict: Dict) -> BaseInnerResponse {
        super.buildFromJSONDict(JSONDict: JSONDict)
        
        url = ParseValidator.getStringForKey(key: "url", JSONDict: JSONDict, defaultValue: "")
        
        return self
    }
}
