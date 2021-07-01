//
//  BitViewController.swift
//  MeshulamSDK
//
//  Created by Inmanage LTD on 22/06/2021.
//

import UIKit

 class BitViewController: UIViewController, UIAlertViewDelegate {

    var createPaymentProcess: CreatePaymentProcessResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PaymentManager.shared.delegate = self
    }
    
    private func startBitProgress() {
        openBitApp()
    }
    
    private func openBitApp() {
        if let url = URL(string: createPaymentProcess?.url ?? "") {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func didTapExit(_ sender: Any) {
        PaymentManager.shared.callCancelBitPaymentRequest(requestFinishDelegate: nil)
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) {
    
        let alert = UIAlertController(title: "Bit",
                                      message: "Succ",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alert, animated: true)
       
    }
}



extension BitViewController: PaymentManagerDelegate {
    func createPaymentProcessResponseSucceeded(with response: CreatePaymentProcessResponse) {
        createPaymentProcess = response
        startBitProgress()
    }
}
