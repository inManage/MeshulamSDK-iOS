//
//  Constants.swift
//  Alamofire
//
//  Created by Inmanage LTD on 30/05/2021.
//

import Foundation

public class Constants {
    #if DEBUG
    static let debugMode = true
    #else
    static let debugMode = true
    #endif
}

public struct ServerRequests {
    static let request = "request"
    static let initSDK = "initSDK"
    static let createPaymentProcess = "createPaymentProcess"
    static let getBitPaymentStatus = "getBitPaymentStatus"
    static let setBitPayment = "setBitPaymentRequest"
    static let cancelBitPayment = "cancelBitPayment"
    static let getPaymentProcessInfo = "getPaymentProcessInfo"
    static let settleSuspendedTransaction = "settleSuspendedTransactionRequest"
    static let doPayment = "doPayment"
}

public struct ServerParamNames {
    static let udid = "udid"
    static let applicationToken = "applicationToken"
    static let pageCode = "pageCode"
    static let userId = "userId"
    static let apiKey = "apiKey"
    static let bitPaymentId = "bit_payment_id"
}

public struct HeadersRequest {
    static let token = "TOKEN"
    static let inmangaSecure = "inmanga_secure"
}

public struct Error {
    var id: Int = 0
    var errorMessage = ""
}

public enum PaymentStatusOptions: Int {
    case success = 1, failed, pending
}

let apiVersion = "1.0"
let defaultPath = "api/light/iphone/\(apiVersion)/"
let logHelper = "\n\t\t"

func LogMsg(_ logMessage: Any) {
    if Constants.debugMode {
        print("\(logMessage)")
    } else { return }
}
