//
//  Constants.swift
//  Alamofire
//
//  Created by Inmanage LTD on 30/05/2021.
//

import Foundation

public typealias Dict = [String: Any]

public struct Observers {
    static let willEnterForeground = Notification.Name("UIApplicationWillEnterForegroundNotification")
}

public struct Titles {
    static let canclePaymentTitle = "האם אתה בטוח שברצונך לבטל את התשלום?"
}

public struct ButtonsTitle {
    static let okBtn = "הבנתי, תודה"
    static let bitBtn = "המשך עם"
    static let cancleBtn = "ביטול"
}

public struct ServerRequests {
    static let request = "request"
    static let initSDK = "initSDK"
    static let createPaymentProcess = "createPaymentProcess"
    static let getBitPaymentStatus = "getBitPaymentStatus"
    static let setBitPayment = "setBitPayment"
    static let cancelBitPayment = "cancelBitPayment"
    static let getPaymentProcessInfo = "getPaymentProcessInfo"
    static let settleSuspendedTransaction = "settleSuspendedTransaction"
    static let doPayment = "doPayment"
    static let cancelBitTransaction = "cancelBitTransaction"
}

public struct ServerParamNames {
    static let udid = "udid"
    static let applicationToken = "applicationToken"
    static let pageCode = "pageCode"
    static let userId = "userId"
    static let apiKey = "apiKey"
    static let bitPaymentId = "bit_payment_id"
    static let sum = "sum"
    static let email = "pageField[email]"
    static let fullName = "pageField[fullName]"
    static let phoneNumber = "pageField[phone]"
    static let chargeType = "chargeType"
    static let templateType = "templateType"
    static let transactionId = "transactionId"
    static let description = "description"
    static let firstPaymentSum = "first_payment_sum"
    static let full_name = "full_name"
    static let invoiceName = "invoiceName"
    static let pageHash = "page_hash"
    static let paymentNum = "payment_num"
    static let periodicalPaymentSum = "periodical_payment_sum"
    static let phone = "phone"
    static let platform = "platform"
    static let showPaymentsSelect = "show_payments_select"
    static let transactionTypeId = "transaction_type_id"
    static let typeId = "type_id"
    static let processId = "processId"
    static let processToken = "processToken"
}

public struct HeadersRequest {
    static let token = "TOKEN"
    static let inmangaSecure = "inmanga_secure"
}

public struct Encryption {
    static let key = ""
}

@objc public class Error: NSObject {
    var id: Int = 0
    var errorMessage = ""
    
    init(id: Int, errorMessage: String) {
        self.id = id
        self.errorMessage = errorMessage
    }
}

public enum PaymentStatusOptions: Int {
    case success = 1, failed, panding
}

let apiVersion = "1.0"
let defaultPath = "api/light/iphone/\(apiVersion)/"
let logHelper = "\n\t\t"


public class Constants {
    #if DEBUG
    static let debugMode = false
    #else
    static let debugMode = false
    #endif
}

func LogMsg(_ logMessage: Any) {
    if Constants.debugMode {
        print("\(logMessage)")
    } else { return }
}
