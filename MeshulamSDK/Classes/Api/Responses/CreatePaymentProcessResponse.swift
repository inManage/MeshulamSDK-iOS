//
//  CreatePaymentProcessResponse.swift
//  MeshulamSDK
//
//  Created by Inmanage LTD on 31/05/2021.
//

import Foundation

public class CreatePaymentProcessResponse: BaseInnerResponse {
    
    var url = ""
    var bitPaymentId = ""
    var processToken = ""
    var doPaymentRequestArr = DoPaymentRequestArr()
    var processId = 0
    
    public override func buildFromJSONDict(JSONDict: Dict) -> BaseInnerResponse {
        super.buildFromJSONDict(JSONDict: JSONDict)
        
        let getString = ParseValidator.getStringForKey.self
        
        url = getString("url", JSONDict,  "")
        processToken = getString("processToken", JSONDict, "")
        bitPaymentId = getString("bit_payment_id", JSONDict, "")
        
        return self
    }
}

class DoPaymentRequestArr: BaseInnerResponse {
    
    var desc = ""
    var firstPaymentSum = ""
    var fullName = ""
    var invoiceName = ""
    var pageHash = ""
    var periodicalPaymentSum = ""
    var phone = ""
    var platform = ""
    var showPaymentsSelect = ""
    
    var email = 0
    var paymentNum = 0
    var sum = 0
    var transactionTypeId = 0
    var typeId = 0
    
    public override func buildFromJSONDict(JSONDict: Dict) -> BaseInnerResponse {
        super.buildFromJSONDict(JSONDict: JSONDict)
        
        let getString = ParseValidator.getStringForKey.self
        let getInt = ParseValidator.getIntForKey.self
        
        desc = getString("description", JSONDict, "")
        firstPaymentSum = getString("first_payment_sum", JSONDict, "")
        fullName = getString("full_name", JSONDict, "")
        invoiceName = getString("invoiceName", JSONDict, "")
        pageHash = getString("page_hash", JSONDict, "")
        periodicalPaymentSum = getString("periodical_payment_sum", JSONDict, "")
        phone = getString("phone", JSONDict, "")
        platform = getString("platform", JSONDict, "")
        showPaymentsSelect = getString("show_payments_select", JSONDict, "")
        
        email = getInt("email", JSONDict, 0)
        paymentNum = getInt("payment_num", JSONDict, 0)
        sum = getInt("sum", JSONDict, 0)
        transactionTypeId = getInt("transaction_type_id", JSONDict, 0)
        typeId = getInt("typeId", JSONDict, 0)
        
        return self
    }
}
