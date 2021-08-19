//
//  CreatePaymentProcessRequest.swift
//  MeshulamSDK
//
//  Created by Inmanage LTD on 31/05/2021.
//

import Foundation

class CreatePaymentProcessRequest: MeshulamBaseRequest {
    
    public override func createResponseFromJSONDict(JSONDict: Dict) -> MeshulamBaseServerResponse? {
        let response = CreatePaymentProcessResponse()
        return  MeshulamBaseServerResponse.initFromJSONDict(JSONDict:JSONDict, withInnerResponse: response)
    }
    
    public static func createPaymentProcessDictParams() -> Dict {
        var initialDictParams = [String:Any]()
        
        let applicationToken = MeshulamNetworkManager.shared.applicationToken
        if !applicationToken.isEmpty {
            initialDictParams.updateValue(applicationToken, forKey: ServerParamNames.applicationToken)
        }
        
        let description = Meshulam.shared().strDescription
        if !description.isEmpty {
            initialDictParams.updateValue(description, forKey: ServerParamNames.description)
        }
        
        let email = Meshulam.shared().email
        if !email.isEmpty {
            initialDictParams.updateValue(email, forKey: ServerParamNames.email)
        }
        
        let pageCode = Meshulam.shared().pageCode.aesEncrypt()
        if !pageCode.isEmpty {
            initialDictParams.updateValue(pageCode, forKey: ServerParamNames.pageCode)
        }
        
        let userId = Meshulam.shared().userId.aesEncrypt()
        if !userId.isEmpty {
            initialDictParams.updateValue(userId, forKey: ServerParamNames.userId)
        }
        
        let apiKey = Meshulam.shared().apiKey.aesEncrypt()
        if !apiKey.isEmpty {
            initialDictParams.updateValue(apiKey, forKey: ServerParamNames.apiKey)
        }
        
        let sum = Meshulam.shared().sum
        if !sum.isEmpty {
            initialDictParams.updateValue(sum, forKey: ServerParamNames.sum)
        }
        
        let fullName = Meshulam.shared().fullName
        if !fullName.isEmpty {
            initialDictParams.updateValue(fullName, forKey: ServerParamNames.fullName)
        }
        
        let phoneNumber =  Meshulam.shared().phoneNumber
        if !phoneNumber.isEmpty {
            initialDictParams.updateValue(phoneNumber, forKey: ServerParamNames.phoneNumber)
        }
       
        initialDictParams.updateValue("2", forKey: ServerParamNames.chargeType)
        initialDictParams.updateValue("8", forKey: ServerParamNames.templateType)

        return initialDictParams
    }
    
    public override var requestName: String {
        get {
            return ServerRequests.createPaymentProcess
        }
    }
}
