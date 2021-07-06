//
//  SessionManager.swift
//  MeshulamSDK
//
//  Created by Inmanage LTD on 22/06/2021.
//

import Foundation
import UIKit

public class SessionManager  {
    
    public static var shared = SessionManager()
    
    public func pushBitVC() {
        let storyboard = UIStoryboard(name: "MeshulamMain", bundle: nil)
        guard let bitVC = storyboard.instantiateViewController(withIdentifier: "BitStatusViewController") as? BitStatusViewController else { return }
        bitVC.modalPresentationStyle = .fullScreen
        UIApplication.shared.keyWindow!.rootViewController?.present(bitVC, animated: true)
    }
}
