//
//  MeshulamDelegate.swift
//  MeshulamSDK
//
//  Created by Inmanage LTD on 31/05/2021.
//

import Foundation

public protocol MeshulamDelegate: NSObjectProtocol {
    func onSuccess()
    func onFailure(_ error: Error)
    func onCancle()
}

