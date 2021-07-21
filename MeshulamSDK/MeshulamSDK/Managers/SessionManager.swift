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
    
    public func pushBitStatusVC() {
        let storyboard = UIStoryboard(name: "MeshulamMain", bundle: nil)
        guard let bitVC = storyboard.instantiateViewController(withIdentifier: "BitStatusViewController") as? BitStatusViewController else { return }
        bitVC.modalPresentationStyle = .fullScreen
        if let vc = UIApplication.getTopViewController() {
            vc.present(bitVC, animated: true)
        }
    }
}
