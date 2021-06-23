//
//  Meshulam.swift
//  MeshulamSDK
//
//  Created by Inmanage LTD on 26/05/2021.
//

import Foundation


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
}
