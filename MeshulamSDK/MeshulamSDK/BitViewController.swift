//
//  BitViewController.swift
//  MeshulamSDK
//
//  Created by Inmanage LTD on 22/06/2021.
//

import UIKit

class BitViewController: UIViewController, PaymentManagerDelegate {

    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var exitBtn: UIButton!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setDelegate()
    }
    
    private func setupUI() {
        //TODO: add font to system:
        // chack list:
        // added ftt to podspec in s.resources
        // added full font Heebo.tff to resurces
        // Experience to change font from storyboard
        titleLable.font = UIFont(name: "Heebo-Regular", size: 22)
    }
    
    private func setDelegate() {
        PaymentManager.shared.delegate = self
    }
    
    @IBAction func didTapExit(_ sender: Any) {
        PaymentManager.shared.isTappedOnExitBtn = true
        presentCanclePaymentProccesPopup()
    }
    
    private func presentCanclePaymentProccesPopup() {
        PopupManager.shared.pushPopup(strTitle: Titles.canclePaymentTitle,
                                           showImageInFirstBtn: true,
                                           strFirstBtn: ButtonsTitle.bitBtn,
                                           strSecondBtn: ButtonsTitle.cancleBtn) { tryAgain in
            tryAgain ? self.handlePayTap() : self.handleExitTap()
        }
    }
    
    private func handleExitTap() {
        dismissVC()
        PaymentManager.shared.callCancelBitPaymentRequest()
    }
    
    private func handlePayTap() {
        PaymentManager.shared.callCreatePaymentProcess()
    }
    
    private func dismissVC() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.dismiss(animated: false)
        }
    }
}

extension BitViewController {
    func setBitPaymentFailure() {
        dismissVC()
    }
}
