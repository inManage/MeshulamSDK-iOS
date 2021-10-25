//
//  Meshulam.swift
//  MeshulamSDK
//
//  Created by Inmanage LTD on 26/05/2021.
//

import UIKit

open class Meshulam: NSObject {

    open weak var delegate: MeshulamDelegate?
    
    /**
     Initialize `Meshulam` (as singleton)
     Returns the default singleton instance. You are not allowed to create your own instances of this class.
     */
    public static var shared = Meshulam()

    /**
     Destroy `Meshulam` singleton
     */
    open class func destroy() {
        self.shared = Meshulam()
    }
    
    private (set) var pageCode = ""
    private (set) var apiKey = ""
    private (set) var userId = ""
    private (set) var fullName = ""
    private (set) var phoneNumber = ""
    private (set) var sum = ""
    private (set) var email = ""
    private (set) var strDescription = ""
    private (set) var transactionId = ""
    private (set) var processId = ""
    private (set) var processToken = ""

    private override init() {
        super.init()
        initCustomFont()
    }
    
    public func createPaymentProcess(pageCode: String, apiKey: String, userId: String, fullName: String, phoneNumber: String, sum: String, email: String? = nil, description: String? = nil, delegate: MeshulamDelegate) {
    
        Meshulam.shared.fullName = fullName
        Meshulam.shared.phoneNumber = phoneNumber
        Meshulam.shared.sum = sum
        Meshulam.shared.apiKey = apiKey
        Meshulam.shared.pageCode = pageCode
        Meshulam.shared.userId = userId
        Meshulam.shared.delegate = delegate
        
        if let email = email {
            Meshulam.shared.email = email
        }
        if let description = description {
            Meshulam.shared.strDescription = description
        }
        
        MeshulamStartupManager.shared.callInitSDK()
        MeshulamSessionManager.shared.pushBitStatusVC()
    }
    
    public func settleSuspendedTransaction(apiKey: String, userId: String, sum: String, transactionId: String, delegate: MeshulamDelegate) {
        Meshulam.shared.apiKey = apiKey
        Meshulam.shared.sum = sum
        Meshulam.shared.userId = userId
        Meshulam.shared.transactionId = transactionId
        Meshulam.shared.delegate = delegate
        MeshulamPaymentManager.shared.callSettleSuspendedTransactionRequest()
    }
    
    public func getPaymentProcessInfo(processId: String, processToken: String, delegate: MeshulamDelegate) {
        Meshulam.shared.processId = processId
        Meshulam.shared.processToken = processToken
        Meshulam.shared.delegate = delegate
        MeshulamPaymentManager.shared.callGetPaymentProcessInfoRequest()
    }
    
    public func cancelBitTransaction(processId: String, processToken: String, delegate: MeshulamDelegate) {
        Meshulam.shared.processId = processId
        Meshulam.shared.processToken = processToken
        Meshulam.shared.delegate = delegate
        MeshulamPaymentManager.shared.callCancelBitTransactionRequest()
    }

    public func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) {
        MeshulamPaymentManager.shared.callSetBitPaymentRequest()
    }
    
    private func initCustomFont() {
        UIFont.jbs_registerFont(
            withFilenameString: "Heebo-Regular.ttf",
            bundle: Bundle(identifier: "com.inmanage.MeshulamSDK")!
        )
        UIFont.jbs_registerFont(
            withFilenameString: "Heebo-Medium.ttf",
            bundle: Bundle(identifier: "com.inmanage.MeshulamSDK")!
        )
        UIFont.jbs_registerFont(
            withFilenameString: "Heebo-Bold.ttf",
            bundle: Bundle(identifier: "com.inmanage.MeshulamSDK")!
        )
    }
}
