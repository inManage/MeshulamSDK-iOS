//
//  MeshulamPopupViewController.swift
//  MeshulamSDK
//
//  Created by Inmanage LTD on 05/07/2021.
//

import UIKit

class MeshulamPopupViewController: UIViewController {
    
    @IBOutlet weak var vwContainer: UIView!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var subTitleLable: UILabel!
    @IBOutlet weak var firstBtn: UIButton!
    @IBOutlet weak var secondBtn: UIButton!
    
    var popupInfoObj : PopupInfoObj?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .clear
        view.alpha = 0
        vwContainer.alpha = 0
        
        if let title = popupInfoObj?.strTitle {
            titleLable.text = title
        } else {
            titleLable.isHidden = true
        }
        if let subTitle = popupInfoObj?.strSubtitle {
            subTitleLable.text = subTitle
        } else {
            subTitleLable.isHidden = true
        }
        if let firstBtnTitle = popupInfoObj?.strFirstButtonTitle {
            firstBtn.setTitle(firstBtnTitle, for: .normal)
        } else {
            firstBtn.isHidden = true
        }
        if let _ = popupInfoObj?.showImageInFirstButton {
            firstBtn.imageView?.isHidden = false
        } else {
            firstBtn.setImage(UIImage(), for: .normal)
        }
        if let secondBtnTitle = popupInfoObj?.strSecondButtonTitle {
            secondBtn.setTitle(secondBtnTitle, for: .normal)
        } else {
            secondBtn.isHidden = true
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animatePresentVC()
    }
    
    private func animatePresentVC() {
        UIView.animate(withDuration: 0.1) {
            let backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
            self.view.backgroundColor = backgroundColor
            self.view.alpha = 1
            self.vwContainer.alpha = 1
        }
    }
    
    private func dismissPopup(completion: @escaping (() -> Void)) {
        UIView.animate(withDuration: 0.3) {
            self.view.alpha = 0
            self.view.layoutIfNeeded()
        } completion: { _ in
            self.dismiss(animated: true)
            completion()
        }
    }
    
    @IBAction func didTapExit(_ sender: Any) {
        dismissPopup {
            if let aPopupInfo = self.popupInfoObj {
                if let exitPopup = aPopupInfo.exitPopup {
                    exitPopup()
                }
            }
        }
    }
    
    @IBAction func didTapSecondBtn(_ sender: Any) {
        dismissPopup {
            if let aPopupInfo = self.popupInfoObj {
                if let secondButtonAction = aPopupInfo.secondButtonAction {
                    secondButtonAction()
                }
            }
        }
        
    }
    
    @IBAction func didTapFirstBtn(_ sender: Any) {
        dismissPopup {
            if let aPopupInfo = self.popupInfoObj {
                if let firstButtonAction = aPopupInfo.firstButtonAction {
                    firstButtonAction()
                }
            }
        }
    }
}
