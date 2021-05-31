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
}

public struct ServerParamNames {
    static let udid = "udid"
}

public struct HeadersRequest {
    static let token = "TOKEN"
    static let inmangaSecure = "inmanga_secure"
}

let logHelper = "\n\t\t"

func LogMsg(_ logMessage: Any) {
    if Constants.debugMode {
        print("\(logMessage)")
    } else { return }
}
