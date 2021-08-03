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
    
    var transactionId = ""
    var processId = ""
    var processToken = ""
    
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
        Meshulam.shared().settleSuspendedTransaction(apiKey: "cbf3b862e094",
                                                     userId: "41deb6f1347ee8b2",
                                                     sum: "1",
                                                     transactionId: transactionId)
    }
    
    private func handleGetPaymentProcessInfo() {
        Meshulam.shared().getPaymentProcessInfo(processId: processId, processToken: processToken)
    }
    
    private func handleCancelBitTransaction() {
        Meshulam.shared().cancelBitTransaction(processId: processId, processToken: processToken)
    }

    
    //MARK - Actions
    @IBAction func didTapCancelBitTransaction(_ sender: Any) {
        handleCancelBitTransaction()
    }
    
    @IBAction func didTapPayWithBit(_ sender: Any) {
        configureMeshulamSDK()
    }
    
    @IBAction func didTapGetPaymentProcessInfo(_ sender: Any) {
        handleGetPaymentProcessInfo()
    }
    
    @IBAction func didTapSettleSuspendedTransaction(_ sender: Any) {
        settleSuspendedTransaction()
    }
}

extension ViewController: MeshulamDelegate {
    
    func createPaymentProccesSuccess(_ processId: String,_ processToken: String) {
        self.processId = processId
        self.processToken = processToken
    }
    
    func setBitPaymentSuccess(_ transactionId: String) {
        self.transactionId = transactionId
    }

    func settleSuspendedTransactionSuccess(response: String) {
        print("\(response)")
    }
    
    func getPaymentProcessInfoSuccess(response: String) {
        print("\(response)")
    }

    func onFailure(_ error: Error) {
        print(error)
    }

    func onCancel() {
     
    }
}

