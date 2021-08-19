//
//  MeshulamDelegate.swift
//  MeshulamSDK
//
//  Created by Inmanage LTD on 31/05/2021.
//

import Foundation

@objc public protocol MeshulamDelegate: NSObjectProtocol {
    func setBitPaymentSuccess(_ transactionId: String)
    func settleSuspendedTransactionSuccess(response: String)
    func createPaymentProccesSuccess(_ processId: String,_ processToken: String)
    func getPaymentProcessInfoSuccess(response: String)
    func onFailure(_ error: String)
    func onCancel()
}

