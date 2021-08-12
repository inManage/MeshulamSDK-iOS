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
    var processId = ""
    
    public override func buildFromJSONDict(JSONDict: Dict) -> BaseInnerResponse {
        super.buildFromJSONDict(JSONDict: JSONDict)
        
        let getString = MeshulamParseValidator.getStringForKey.self
        
        url = getString("url", JSONDict,  "")
        processToken = getString("processToken", JSONDict, "")
        processId = getString("processId", JSONDict, "")
        bitPaymentId = getString("bit_payment_id", JSONDict, "")
        
        let doPaymentRequestArrTemp = MeshulamParseValidator.getDictionaryForKey(key: "do_payment_requestArr", JSONDict: JSONDict, defaultValue: [String: Any]())
        doPaymentRequestArr = DoPaymentRequestArr().buildFromJSONDict(JSONDict: doPaymentRequestArrTemp) as! DoPaymentRequestArr
        
        return self
    }
}

class DoPaymentRequestArr: BaseInnerResponse, Codable {
    
    var desc = ""
    var firstPaymentSum = ""
    var fullName = ""
    var invoiceName = ""
    var pageHash = ""
    var periodicalPaymentSum = ""
    var phone = ""
    var platform = ""
    var showPaymentsSelect = ""
    var email = ""
    var paymentNum = ""

    var sum = ""
    var transactionTypeId = ""
    var typeId = ""
    
    public override func buildFromJSONDict(JSONDict: Dict) -> BaseInnerResponse {
        super.buildFromJSONDict(JSONDict: JSONDict)
        
        let getString = MeshulamParseValidator.getStringForKey.self
        
        desc = getString("description", JSONDict, "")
        firstPaymentSum = getString("first_payment_sum", JSONDict, "")
        fullName = getString("full_name", JSONDict, "")
        invoiceName = getString("invoiceName", JSONDict, "")
        pageHash = getString("page_hash", JSONDict, "")
        periodicalPaymentSum = getString("periodical_payment_sum", JSONDict, "")
        phone = getString("phone", JSONDict, "")
        platform = getString("platform", JSONDict, "")
        showPaymentsSelect = getString("show_payments_select", JSONDict, "")
        email = getString("email", JSONDict, "")
        paymentNum = getString("payment_num", JSONDict, "")
        sum = getString("sum", JSONDict, "")
        transactionTypeId = getString("transaction_type_id", JSONDict, "")
        typeId = getString("type_id", JSONDict, "")
        
        return self
    }
}
