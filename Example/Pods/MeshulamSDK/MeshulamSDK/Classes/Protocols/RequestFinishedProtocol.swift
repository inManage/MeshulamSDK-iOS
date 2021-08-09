//
//  RequestFinishedProtocol.swift
//  Alamofire
//
//  Created by Inmanage LTD on 30/05/2021.
//

import Foundation

public protocol RequestFinishedProtocol : class {
    func requestSucceeded(request:BaseRequest, response:BaseInnerResponse)
    func requestFailed(request:BaseRequest, response:BaseServerResponse?)
}
