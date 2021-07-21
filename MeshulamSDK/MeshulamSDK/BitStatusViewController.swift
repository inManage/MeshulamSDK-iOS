//
//  BitStatusViewController.swift
//  MeshulamSDK
//
//  Created by Inmanage LTD on 06/07/2021.
//

import Foundation
import UIKit
import Lottie

class BitStatusViewController: UIViewController {
    
    @IBOutlet weak var animateView: LottieView!
    @IBOutlet weak var subTitleLable: UILabel!
    @IBOutlet weak var bottonBtn: UIButton!
    @IBOutlet weak var initialBitView: UIView!
    
    private var animationView: AnimationView?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureAnimateView()
        setDelegate()
    }

    private func setDelegate() {
        PaymentManager.shared.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(willEnterForeground), name: Notification.Name("UIApplicationWillEnterForegroundNotification"), object: nil)
    }
 
    @objc func willEnterForeground() {
        animationView!.play()
    }
    
    private func configureAnimateView() {
        animationView = .init(name: "loader")
        animationView!.frame = animateView.bounds
        animationView!.contentMode = .scaleAspectFit
        animationView!.loopMode = .loop
        animationView!.animationSpeed = 0.9
        animateView.addSubview(animationView!)
        animationView!.play()
    }
    
    private func startBitProcces() {
        PaymentManager.shared.callCreatePaymentProcess()
    }
    
    @IBAction func didTapExitBtn(_ sender: Any) {
        PaymentManager.shared.isTappedOnExitBtn = true
        presentCanclePaymentProccesPopup()
    }
}

extension BitStatusViewController: PaymentManagerToBitStatusVCDelegate {
    
    func cancelBitPayment() {
        Meshulam.shared().delegate?.onCancel()
        Meshulam.destroy()
    }
    
    func bitOpened() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            self.initialBitView.isHidden = true
        }
    }
    
    func setBitPaymentSuccess() {
        Meshulam.shared().delegate?.onSuccess()
        Meshulam.destroy()
        self.dismiss(animated: true)
    }
    
    func createPaymentProcessSuccess() {
    }
    
    func setBitPaymentFailure() {
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
        PaymentManager.shared.callCancelBitPaymentRequest()
        self.dismiss(animated: true)
    }
    
    private func handlePayTap() {
        startBitProcces()
    }
}
