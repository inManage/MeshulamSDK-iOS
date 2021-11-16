//
//  SessionManager.swift
//  MeshulamSDK
//
//  Created by Inmanage LTD on 22/06/2021.
//

import Foundation
import UIKit

public class MeshulamSessionManager  {
    
    public static var shared = MeshulamSessionManager()
    
    public func pushBitStatusVC() {
        let frameworkBundle = Bundle(identifier: "com.inmanage.MeshulamSDK")
        let storyboard = UIStoryboard(name: "MeshulamMain", bundle: frameworkBundle)
        guard let bitVC = storyboard.instantiateViewController(withIdentifier: "BitStatusViewController") as? BitStatusViewController else { return }
        bitVC.modalPresentationStyle = .fullScreen
        if let vc = UIApplication.getTopViewController() {
            vc.present(bitVC, animated: true)
        }
    }
}
