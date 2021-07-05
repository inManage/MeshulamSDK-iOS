//
//  PopupViewControllerDelegate.swift
//  MeshulamSDK
//
//  Created by Inmanage LTD on 05/07/2021.
//

import Foundation

@objc protocol PopupViewControllerDelegate : NSObjectProtocol {
    
    @objc optional func closePopupVC(popupVC: MeshulamPopupViewController)
    
}
