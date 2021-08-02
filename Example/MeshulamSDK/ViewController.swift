//
//  ViewController.swift
//  MeshulamSDK
//
//  Created by amita@inmanage.net on 05/26/2021.
//  Copyright (c) 2021 amita@inmanage.net. All rights reserved.
//

import UIKit
import MeshulamSDK

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func configureMeshulamSDK() {
        Meshulam.shared().delegate = self
        Meshulam.shared().createPaymentProcess(pageCode: "a1a40d5ce46f",
                                    apiKey: "cbf3b862e094",
                                    userId: "41deb6f1347ee8b2",
                                    fullName: "Amit Azulay",
                                    phoneNumber: "0542533691",
                                    sum: "1")
    }
    
    private func settleSuspendedTransaction() {
        Meshulam.shared().settleSuspendedTransaction(apiKey: "", userId: "", sum: "", transactionId: "")
    }
    
    @IBAction func didTapPayWithBit(_ sender: Any) {
        configureMeshulamSDK()
    }
    
    @IBAction func didTapSettleSuspendedTransaction(_ sender: Any) {
        settleSuspendedTransaction()
    }
    
}

extension ViewController: MeshulamDelegate {
    func onCancel() {
        print("onCancle")
    }
    
    func onSuccess(_ getPaymentInfoResponse: String) {
        print(getPaymentInfoResponse)
    }

    func onFailure(_ error: Error) {
        print(error)
    }
}

