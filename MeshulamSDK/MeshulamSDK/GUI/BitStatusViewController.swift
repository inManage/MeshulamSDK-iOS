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
        subTitleLable.font = UIFont(name: "Hebbo-Regular", size: 18)
    }

    deinit {
        removeObservers()
    }
    
    private func setDelegate() {
        PaymentManager.shared.delegate = self
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(willEnterForeground),
                                               name: Observers.willEnterForeground,
                                               object: nil)
    }
    
    @objc func willEnterForeground() {
        animationView!.play()
    }
    
    private func removeObservers() {
        NotificationCenter.default.removeObserver(self)
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
   
    @IBAction func didTapExitBtn(_ sender: Any) {
        PaymentManager.shared.isTappedOnExitBtn = true
        presentCanclePaymentProccesPopup()
    }
}

extension BitStatusViewController: PaymentManagerToBitStatusVCDelegate {
    
    func settleSuspendedTransactionSuccess(_ response: String) {
        Meshulam.shared().delegate?.settleSuspendedTransactionSuccess(response: response)
        Meshulam.destroy()
    }

    func cancelBitPayment() {
        Meshulam.shared().delegate?.onCancel()
        Meshulam.destroy()
        dismiss(animated: true)
    }
    
    func bitOpened() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            self.initialBitView.isHidden = true
        }
    }
    
    func setBitPaymentSuccess(_ transectionId: String) {
        Meshulam.shared().delegate?.setBitPaymentSuccess(transectionId)
        dismiss(animated: true)
    }

    func createPaymentProcessSuccess(_ processId: String,_ processToken: String) {
        Meshulam.shared().delegate?.createPaymentProccesSuccess(processId, processToken)
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
        dismiss(animated: true)
    }
    
    private func handlePayTap() {
        PaymentManager.shared.callDoPayment()
    }
}
