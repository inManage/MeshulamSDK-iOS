//
//  SessionManager.swift
//  MeshulamSDK
//
//  Created by Inmanage LTD on 22/06/2021.
//

import Foundation
import UIKit

public class SessionManager  {
    
    static let shared = SessionManager()
    
    public func pushBitVC() {
        let storyboard = UIStoryboard(name: "MainS", bundle: nil)
        guard let bitVC = storyboard.instantiateViewController(withIdentifier: "BitViewController") as? BitViewController else { return }
        bitVC.modalPresentationStyle = .fullScreen
        UIApplication.shared.keyWindow!.rootViewController?.present(bitVC, animated: true)
    }
}
