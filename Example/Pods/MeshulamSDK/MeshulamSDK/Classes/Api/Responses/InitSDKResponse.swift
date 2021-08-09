//
//  InitSDKResponse.swift
//  MeshulamSDK
//
//  Created by Inmanage LTD on 26/05/2021.
//

import Foundation

public class InitSDKResponse: BaseInnerResponse {
    
    var hostURL : String = ""
    var applicationToken: String = ""

    var maxTime : Int = 0
    var startDelay : Int = 0
    var intervalLength: Int = 0
    
    var translationArr = ""//TODO - pars translationArr
    
    public override func buildFromJSONDict(JSONDict: Dict) -> BaseInnerResponse {
        super.buildFromJSONDict(JSONDict: JSONDict)
        hostURL = ParseValidator.getStringForKey(key: "hostUrl", JSONDict: JSONDict, defaultValue: "")
        applicationToken = ParseValidator.getStringForKey(key: "applicationToken", JSONDict: JSONDict, defaultValue: "")
        
        intervalLength = ParseValidator.getIntForKey(key: "intervalLength", JSONDict: JSONDict, defaultValue: 0)
        maxTime =  ParseValidator.getIntForKey(key: "maxTime", JSONDict: JSONDict, defaultValue: 0)
        startDelay = ParseValidator.getIntForKey(key: "startDelay", JSONDict: JSONDict, defaultValue: 0)
        
        translationArr = ""//TODO - pars translationArr
        
        return self
    }
}
