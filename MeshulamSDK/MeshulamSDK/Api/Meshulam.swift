//
//  Meshulam.swift
//  MeshulamSDK
//
//  Created by Inmanage LTD on 26/05/2021.
//

import UIKit

open class Meshulam: NSObject {

    open weak var delegate: MeshulamDelegate?
    private static var sharedInstance: Meshulam?
    
    /**
     Initialize `Meshulam` (as singleton)
     Returns the default singleton instance. You are not allowed to create your own instances of this class.
     */
    open class func shared() -> Meshulam {
        guard let instance = self.sharedInstance else {
            self.sharedInstance = Meshulam()
            return sharedInstance!
        }
        return instance
    }

    /**
     Destroy `Meshulam` singleton
     */
    open class func destroy() {
        self.sharedInstance = nil
    }
    
    private (set) var pageCode = ""
    private (set) var apiKey = ""
    private (set) var userId = ""
    private (set) var fullName = ""
    private (set) var phoneNumber = ""
    private (set) var sum = ""

    private override init() {}
    
    public func configure(pageCode: String, apiKey: String, userId: String, fullName: String, phoneNumber: String, sum: String) {
        Meshulam.shared().fullName = fullName
        Meshulam.shared().phoneNumber = phoneNumber
        Meshulam.shared().sum = sum
        Meshulam.shared().apiKey = apiKey
        Meshulam.shared().pageCode = pageCode
        Meshulam.shared().userId = userId
        StartupManager.shared.callInitSDK()
        SessionManager.shared.pushBitVC()
    }
    

    public func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) {
        PaymentManager.shared.callSetBitPaymentRequest()
        print("url meshulam",url.absoluteString)
    }
}
