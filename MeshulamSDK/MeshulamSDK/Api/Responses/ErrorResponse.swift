//
//  ErrorResponse.swift
//  MeshulamSDK
//
//  Created by Inmanage LTD on 26/05/2021.
//

import Foundation

public class ErrorResponse: BaseInnerResponse {
    
    var message: String = ""
    
    public override func buildFromJSONDict(JSONDict: Dict) -> BaseInnerResponse {
        super.buildFromJSONDict(JSONDict: JSONDict)
        
        message = MeshulamParseValidator.getStringForKey(key: "message", JSONDict: JSONDict, defaultValue: "")
        
        return self
    }
    
}

