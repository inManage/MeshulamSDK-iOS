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
    @IBOutlet weak var initialBitView: UIView!
    @IBOutlet weak var titleLable: UILabel!
    
    private var animationView: AnimationView?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureAnimateView()
    }

    deinit {
        removeObservers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setDelegate()
    }
    
    private func setDelegate() {
        MeshulamNetworkManager.shared.delegate = self
        MeshulamStartupManager.shared.delegate = self
        MeshulamPaymentManager.shared.delegate = self
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
        let frameworkBundle = Bundle(identifier: "com.inmanage.MeshulamSDK")
        let bundle = frameworkBundle?.path(forResource: "loader", ofType: "json")
        if let b = bundle {
            animationView = .init(filePath: b)
        }
        animationView!.frame = animateView.bounds
        animationView!.contentMode = .scaleAspectFit
        animationView!.loopMode = .loop
        animationView!.animationSpeed = 0.9
        animateView.addSubview(animationView!)
        animationView!.play()
    }
    
    private func destroySDK() {
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didTapExitBtn(_ sender: Any) {
        MeshulamPaymentManager.shared.isTappedOnExitBtn = true
        presentCanclePaymentProccesPopup()
    }
}

extension BitStatusViewController: NetworkManagerDelegate {
    func destorySDK() {
        destroySDK()
    }
}

extension BitStatusViewController: StartupManagerDelegate {
    func initSDKFailed(error: Error) {
        Meshulam.shared().delegate?.onFailure(error.errorMessage)
    }
}

extension BitStatusViewController: PaymentManagerToBitStatusVCDelegate {
    
    func createPaymentProcessFaild(error: Error) {
        Meshulam.shared().delegate?.onFailure(error.errorMessage)
    }

    func cancelBitPayment() {
        Meshulam.shared().delegate?.onCancel()
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
        MeshulamPopupManager.shared.pushPopup(strTitle: Titles.canclePaymentTitle,
                                           showImageInFirstBtn: true,
                                           strFirstBtn: ButtonsTitle.bitBtn,
                                           strSecondBtn: ButtonsTitle.cancleBtn) { callBackStatus in
            switch callBackStatus {
            case .firstBtnTap: self.handlePayTap()
                break
                
            case .secondBtnTap: self.handleExitTap()
                break
                
            case .exitTap: self.handleExitTap()
                break
            }
        }
    }
    
    private func handleExitTap() {
        MeshulamPaymentManager.shared.callCancelBitPaymentRequest()
    }
    
    private func handlePayTap() {
        MeshulamPaymentManager.shared.callDoPayment()
    }
}
