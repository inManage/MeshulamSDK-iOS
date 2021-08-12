//
//  PopupManager.swift
//  MeshulamSDK
//
//  Created by Inmanage LTD on 05/07/2021.
//

import Foundation
import UIKit

enum callBackStatus: Int {
    case firstBtnTap = 1, secondBtnTap, exitTap
}

public class MeshulamPopupManager: NSObject {
    
    public static var shared = MeshulamPopupManager()
    
    func pushPopup(strTitle: String?,
                        strSubTitle: String? = nil,
                        showImageInFirstBtn: Bool? = nil,
                        strFirstBtn: String?,
                        strSecondBtn: String? = nil,
                        callback: @escaping ((_ callBackStatus: callBackStatus) -> Void)) {
        
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
            callback(.firstBtnTap)
        }
        
        popupInfoObj.secondButtonAction = {
            callback(.secondBtnTap)
        }
        
        popupInfoObj.exitPopup = {
            callback(.exitTap)
        }
        
        showPopup(popupInfoObj)
    }
    
    private func showPopup(_ popupInfoObject: PopupInfoObj) {
        let frameworkBundle = Bundle(identifier: "com.inmanage.MeshulamSDK")
        let storyboard = UIStoryboard(name: "MeshulamPopup", bundle: frameworkBundle)
        guard let popup = storyboard.instantiateViewController(withIdentifier: "MeshulamPopupViewController") as? MeshulamPopupViewController else { return }
        popup.popupInfoObj = popupInfoObject
        popup.modalPresentationStyle = .custom
        let topVC = UIApplication.getTopViewController()
        topVC?.present(popup, animated: true)
    }
}
