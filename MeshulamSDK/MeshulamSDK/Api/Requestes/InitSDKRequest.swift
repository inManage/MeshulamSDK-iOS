//
//  InitSDKRequest.swift
//  MeshulamSDK
//
//  Created by Inmanage LTD on 26/05/2021.
//

import UIKit

public class InitSDKRequest: MeshulamBaseRequest {
    
    public override func createResponseFromJSONDict(JSONDict: Dict) -> MeshulamBaseServerResponse? {
        let response = InitSDKResponse()
        return  MeshulamBaseServerResponse.initFromJSONDict(JSONDict:JSONDict, withInnerResponse: response)
    }
    
    public static func createInitialDictParams() -> Dict {
        var initialDictParams = [String:Any]()
        if let vendor = UIDevice.current.identifierForVendor {
            initialDictParams.updateValue(vendor.uuidString, forKey: ServerParamNames.udid)
        }
        return initialDictParams
    }
    
    public override var requestName: String {
        get {
            return ServerRequests.initSDK
        }
    }
}

