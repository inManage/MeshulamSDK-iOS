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
}

public struct ServerParamNames {
    static let udid = "udid"
    static let applicationToken = "applicationToken"
    static let pageCode = "pageCode"
    static let userId = "userId"
    static let apiKey = "apiKey"
}

public struct HeadersRequest {
    static let token = "TOKEN"
    static let inmangaSecure = "inmanga_secure"
}

public struct Error {
    var id: Int = 0
    var errorMessage = ""
}

let apiVersion = "1.0"
let defaultPath = "api/light/iphone/\(apiVersion)/"
let logHelper = "\n\t\t"

func LogMsg(_ logMessage: Any) {
    if Constants.debugMode {
        print("\(logMessage)")
    } else { return }
}
