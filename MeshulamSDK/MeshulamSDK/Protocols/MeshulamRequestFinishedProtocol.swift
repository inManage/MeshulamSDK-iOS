//
//  RequestFinishedProtocol.swift
//  Alamofire
//
//  Created by Inmanage LTD on 30/05/2021.
//

import Foundation

public protocol MeshulamRequestFinishedProtocol : class {
    func requestSucceeded(request:MeshulamBaseRequest, response:BaseInnerResponse)
    func requestFailed(request:MeshulamBaseRequest, response:MeshulamBaseServerResponse?)
}
