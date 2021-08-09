//
//  GetBitPaymentStatusResponse.swift
//  MeshulamSDK
//
//  Created by Inmanage LTD on 22/06/2021.
//

import Foundation

class GetBitPaymentStatusResponse: BaseInnerResponse {
    
    public override func buildFromJSONDict(JSONDict: Dict) -> BaseInnerResponse {
        super.buildFromJSONDict(JSONDict: JSONDict)
        
        let getString = ParseValidator.getStringForKey.self
        
        return self
    }
}
