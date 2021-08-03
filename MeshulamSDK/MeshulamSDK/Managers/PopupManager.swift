//
//  PopupManager.swift
//  MeshulamSDK
//
//  Created by Inmanage LTD on 05/07/2021.
//

import Foundation
import UIKit

public class PopupManager: NSObject {
    
    public static var shared = PopupManager()
    
    func pushPopup(strTitle: String?,
                        strSubTitle: String? = nil,
                        showImageInFirstBtn: Bool? = nil,
                        strFirstBtn: String?,
                        strSecondBtn: String? = nil,
                        callback: @escaping ((_ isFirstBtn: Bool) -> Void)) {
        
        let popupInfoObj = PopupInfoObj()
        
        popupInfoObj.strTitle = strTitle ?? "no error content"
        popupInfoObj.strFirstButtonTitle = strFirstBtn
        
        //Optional variables
        if strSubTitle != nil {
            popupInfoObj.strSubtitle = strSubTitle!
        }
        
        if strSecondBtn != nil {
            popupInfoObj.strSecondButtonTitle = strSecondBtn!
        }

        if showImageInFirstBtn != nil {
            popupInfoObj.showImageInFirstButton = showImageInFirstBtn!
        }
        
        popupInfoObj.firstButtonAction = {
            callback(false)
        }
        
        popupInfoObj.secondButtonAction = {
            callback(true)
        }
        
        showPopup(popupInfoObj)
    }
    
    private func showPopup(_ popupInfoObject: PopupInfoObj) {
        let storyboard = UIStoryboard(name: "MeshulamPopup", bundle: nil)
        guard let popup = storyboard.instantiateViewController(withIdentifier: "MeshulamPopupViewController") as? MeshulamPopupViewController else { return }
        popup.popupInfoObj = popupInfoObject
        popup.modalPresentationStyle = .custom
        let topVC = UIApplication.getTopViewController()
        topVC?.present(popup, animated: true)
    }
}
