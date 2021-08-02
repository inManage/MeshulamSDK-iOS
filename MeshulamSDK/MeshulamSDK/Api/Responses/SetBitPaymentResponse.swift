//
//  SetBitPaymentResponse.swift
//  MeshulamSDK
//
//  Created by Inmanage LTD on 23/06/2021.
//

import Foundation

public class SetBitPaymentResponse: BaseInnerResponse {
    
    var paymentProcessResponseInfo = PaymentProcessResponseInfo()
    
    public override func buildFromJSONDict(JSONDict: Dict) -> BaseInnerResponse {
        super.buildFromJSONDict(JSONDict: JSONDict)
             
        let paymentProcessResponseInfoTemp = ParseValidator.getDictionaryForKey(key: "getPaymentProcessResponseInfo", JSONDict: JSONDict, defaultValue: [String: Any]())
        paymentProcessResponseInfo = PaymentProcessResponseInfo().buildFromJSONDict(JSONDict: paymentProcessResponseInfoTemp) as! PaymentProcessResponseInfo
        
        
        return self
    }
}


public class PaymentProcessResponseInfo: BaseInnerResponse {
    
    var processId = 0
    var transactions = Transactions()
    
    public override func buildFromJSONDict(JSONDict: Dict) -> BaseInnerResponse {
        super.buildFromJSONDict(JSONDict: JSONDict)
        
        processId = ParseValidator.getIntForKey(key: "processId", JSONDict: JSONDict, defaultValue: 0)

        
        return self
    }
}

public class Transactions: BaseInnerResponse {
    
    var desc = ""
    var fullName = ""
    var payerEmail = ""
    var payerPhone = ""
    var paymentDate = ""
    var status = ""
    
    var sum = 0
    var statusCode = 0
    var paymentType = 0
    var paymentsNum = 0
    var transactionId = 0
    var allPaymentsNum = 0
    var transactionTypeId = 0
    
    public override func buildFromJSONDict(JSONDict: Dict) -> BaseInnerResponse {
        super.buildFromJSONDict(JSONDict: JSONDict)
        
        desc = ParseValidator.getStringForKey(key: "description", JSONDict: JSONDict, defaultValue: "")
        fullName = ParseValidator.getStringForKey(key: "fullName", JSONDict: JSONDict, defaultValue: "")
        payerEmail = ParseValidator.getStringForKey(key: "payerEmail", JSONDict: JSONDict, defaultValue: "")
        paymentDate = ParseValidator.getStringForKey(key: "paymentDate", JSONDict: JSONDict, defaultValue: "")
        status = ParseValidator.getStringForKey(key: "status", JSONDict: JSONDict, defaultValue: "")
        payerPhone = ParseValidator.getStringForKey(key: "payerPhone", JSONDict: JSONDict, defaultValue: "")

        sum = ParseValidator.getIntForKey(key: "sum", JSONDict: JSONDict, defaultValue: 0)
        statusCode = ParseValidator.getIntForKey(key: "statusCode", JSONDict: JSONDict, defaultValue: 0)
        paymentType = ParseValidator.getIntForKey(key: "paymentType", JSONDict: JSONDict, defaultValue: 0)
        paymentsNum = ParseValidator.getIntForKey(key: "paymentsNum", JSONDict: JSONDict, defaultValue: 0)
        transactionId = ParseValidator.getIntForKey(key: "transactionId", JSONDict: JSONDict, defaultValue: 0)
        allPaymentsNum = ParseValidator.getIntForKey(key: "allPaymentsNum", JSONDict: JSONDict, defaultValue: 0)
        transactionTypeId = ParseValidator.getIntForKey(key: "transactionTypeId", JSONDict: JSONDict, defaultValue: 0)
        
        return self
    }
}
