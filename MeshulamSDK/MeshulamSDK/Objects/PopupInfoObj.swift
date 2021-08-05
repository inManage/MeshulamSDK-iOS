//
//  PopupInfoObj.swift
//  MeshulamSDK
//
//  Created by Inmanage LTD on 05/07/2021.
//

import Foundation

class PopupInfoObj : NSObject {
    
    override init() {
        super.init()
    }
    
    var strTitle: String?
    var strSubtitle: String?
    
    // Close button action if needed.    
    var firstButtonAction: (() -> ())?
    var secondButtonAction: (() -> ())?
    var exitPopup: (() -> ())?
    
    var showImageInFirstButton: Bool?
    
    // Buttons are in the order of top to bottom / left to right - Actions/Titles
    var strFirstButtonTitle: String?
    var strSecondButtonTitle: String?
}
