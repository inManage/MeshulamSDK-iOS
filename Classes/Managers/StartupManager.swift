//
//  StartupManager.swift
//  MeshulamSDK
//
//  Created by Inmanage LTD on 26/05/2021.
//

import Foundation

public class StartupManager {
    
    static let shared = StartupManager()
    
    public func callInitSDK(response: @escaping ((_: [String: Any]) -> Void)) {
        let request = InitSDKRequest().initWithDictParams(dictParams: nil)
        NetworkManager.shared.sendRequest(request) { (res) in
            response(res)
        }
    }
}
