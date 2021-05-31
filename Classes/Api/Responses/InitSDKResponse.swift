//
//  InitSDKResponse.swift
//  MeshulamSDK
//
//  Created by Inmanage LTD on 26/05/2021.
//

import Foundation

class InitSDKResponse: BaseInnerResponse {
    
    var hostURL: String = ""
    
    override func buildFromJSONDict(JSONDict: Dict) -> BaseInnerResponse {
        super.buildFromJSONDict(JSONDict: JSONDict)
        hostURL = ParseValidator.getStringForKey(key: "hostUrl", JSONDict: JSONDict, defaultValue: "")
        return self
    }
}
