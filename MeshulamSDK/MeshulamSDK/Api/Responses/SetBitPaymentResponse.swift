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
             
        let paymentProcessResponseInfoTemp = MeshulamParseValidator.getDictionaryForKey(key: "getPaymentProcessResponseInfo", JSONDict: JSONDict, defaultValue: [String: Any]())
        paymentProcessResponseInfo = PaymentProcessResponseInfo().buildFromJSONDict(JSONDict: paymentProcessResponseInfoTemp) as! PaymentProcessResponseInfo
        
        
        return self
    }
}


public class PaymentProcessResponseInfo: BaseInnerResponse {
    
    var processId = 0
    var transactions = [Transactions]()
    
    public override func buildFromJSONDict(JSONDict: Dict) -> BaseInnerResponse {
        super.buildFromJSONDict(JSONDict: JSONDict)
        
        processId = MeshulamParseValidator.getIntForKey(key: "processId", JSONDict: JSONDict, defaultValue: 0)

        let tempTransactions = MeshulamParseValidator.getArrayForKey(key: "transactions", JSONDict: JSONDict, defaultValue: [Any]())
        self.transactions = MeshulamParseValidator.createArrayOfInnerResponsesFromJSONArray(JSONArray: tempTransactions, innerResponse: Transactions(), shouldReverseOrder: false) as! [Transactions]
      
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
    var transactionId = ""

    var sum = 0
    var statusCode = 0
    var paymentType = 0
    var paymentsNum = 0
    var allPaymentsNum = 0
    var transactionTypeId = 0
    
    public override func buildFromJSONDict(JSONDict: Dict) -> BaseInnerResponse {
        super.buildFromJSONDict(JSONDict: JSONDict)
        
        desc = MeshulamParseValidator.getStringForKey(key: "description", JSONDict: JSONDict, defaultValue: "")
        fullName = MeshulamParseValidator.getStringForKey(key: "fullName", JSONDict: JSONDict, defaultValue: "")
        payerEmail = MeshulamParseValidator.getStringForKey(key: "payerEmail", JSONDict: JSONDict, defaultValue: "")
        paymentDate = MeshulamParseValidator.getStringForKey(key: "paymentDate", JSONDict: JSONDict, defaultValue: "")
        status = MeshulamParseValidator.getStringForKey(key: "status", JSONDict: JSONDict, defaultValue: "")
        payerPhone = MeshulamParseValidator.getStringForKey(key: "payerPhone", JSONDict: JSONDict, defaultValue: "")
        transactionId = MeshulamParseValidator.getStringForKey(key: "transactionId", JSONDict: JSONDict, defaultValue: "")

        sum = MeshulamParseValidator.getIntForKey(key: "sum", JSONDict: JSONDict, defaultValue: 0)
        statusCode = MeshulamParseValidator.getIntForKey(key: "statusCode", JSONDict: JSONDict, defaultValue: 0)
        paymentType = MeshulamParseValidator.getIntForKey(key: "paymentType", JSONDict: JSONDict, defaultValue: 0)
        paymentsNum = MeshulamParseValidator.getIntForKey(key: "paymentsNum", JSONDict: JSONDict, defaultValue: 0)
        allPaymentsNum = MeshulamParseValidator.getIntForKey(key: "allPaymentsNum", JSONDict: JSONDict, defaultValue: 0)
        transactionTypeId = MeshulamParseValidator.getIntForKey(key: "transactionTypeId", JSONDict: JSONDict, defaultValue: 0)
        
        return self
    }
}
