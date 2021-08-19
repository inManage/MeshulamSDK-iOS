//
//  DoPaymentRequest.swift
//  MeshulamSDK
//
//  Created by Inmanage LTD on 23/06/2021.
//

import Foundation

class DoPaymentRequest: MeshulamBaseRequest {
    public override func createResponseFromJSONDict(JSONDict: Dict) -> MeshulamBaseServerResponse? {
        let response = DoPaymentResponse()
        return  MeshulamBaseServerResponse.initFromJSONDict(JSONDict:JSONDict, withInnerResponse: response)
    }
    
    public static func createDoPaymentParams(_ paymentRequestArr: DoPaymentRequestArr) -> Dict {
        var parameters = Dict()
        
        let applicationToken = MeshulamNetworkManager.shared.applicationToken
        if !applicationToken.isEmpty {
            parameters.updateValue(applicationToken, forKey: ServerParamNames.applicationToken)
        }
        
        let description = paymentRequestArr.desc
        if !description.isEmpty {
            parameters.updateValue(description, forKey: ServerParamNames.description)
        }
        
        let email = paymentRequestArr.email
        if !email.isEmpty {
            parameters.updateValue(email, forKey: ServerParamNames.email)
        }
        
        let firstPaymentSum = paymentRequestArr.firstPaymentSum
        if !firstPaymentSum.isEmpty {
            parameters.updateValue(firstPaymentSum, forKey: ServerParamNames.firstPaymentSum)
        }
        
        let fullName = paymentRequestArr.fullName
        if !fullName.isEmpty {
            parameters.updateValue(fullName, forKey: ServerParamNames.full_name)
        }
        
        let invoiceName = paymentRequestArr.invoiceName
        if !invoiceName.isEmpty {
            parameters.updateValue(invoiceName, forKey: ServerParamNames.invoiceName)
        }
        
        let pageHash = paymentRequestArr.pageHash
        if !pageHash.isEmpty {
            parameters.updateValue(pageHash, forKey: ServerParamNames.pageHash)
        }
        
        let paymentNum = paymentRequestArr.paymentNum
        if !paymentNum.isEmpty {
            parameters.updateValue(paymentNum, forKey: ServerParamNames.paymentNum)
        }
        
        let periodicalPaymentSum = paymentRequestArr.periodicalPaymentSum
        if !periodicalPaymentSum.isEmpty {
            parameters.updateValue(periodicalPaymentSum, forKey: ServerParamNames.periodicalPaymentSum)
        }
        
        let phone = paymentRequestArr.phone
        if !phone.isEmpty {
            parameters.updateValue(phone, forKey: ServerParamNames.phone)
        }
        
        let platform = paymentRequestArr.platform
        if !platform.isEmpty {
            parameters.updateValue(platform, forKey: ServerParamNames.platform)
        }
        
        let showPaymentsSelect = paymentRequestArr.showPaymentsSelect
        if !showPaymentsSelect.isEmpty {
            parameters.updateValue(showPaymentsSelect, forKey: ServerParamNames.showPaymentsSelect)
        }
        
        let sum = paymentRequestArr.sum
        if !sum.isEmpty {
            parameters.updateValue(sum, forKey: ServerParamNames.sum)
        }
        
        let transactionTypeId = paymentRequestArr.transactionTypeId
        if !transactionTypeId.isEmpty {
            parameters.updateValue(transactionTypeId, forKey: ServerParamNames.transactionTypeId)
        }
        
        let typeId = paymentRequestArr.typeId
        if !typeId.isEmpty {
            parameters.updateValue(typeId, forKey: ServerParamNames.typeId)
        }
        return parameters
    }
    
    public override var requestName: String {
        get {
            return ServerRequests.doPayment
        }
    }
}
