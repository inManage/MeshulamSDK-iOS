//
//  Meshulam.swift
//  MeshulamSDK
//
//  Created by Inmanage LTD on 26/05/2021.
//

import UIKit


open class Meshulam: NSObject {

    open weak var delegate: MeshulamDelegate?
    static public let shared = Meshulam()

    public var pageCode = ""
    public var apiKey = ""
    public var userId = ""
    
    private override init() {
        super.init()
        StartupManager.shared.callInitSDK()
        SessionManager.shared.pushBitVC()
    }
    
    public func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) {
        print("url meshulam",url.absoluteString)
    }
}
