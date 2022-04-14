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
    
    var spinner = UIActivityIndicatorView(activityIndicatorStyle: .gray)

    var transactionId = ""
    var processId = ""
    var processToken = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func configureMeshulamSDK() {
        Meshulam.shared().createPaymentProcess(pageCode: "535dd4248592",
                                    apiKey: "566ac39a90e8",
                                    userId: "b9e895139851c3c5",
                                    fullName: "Amit Azulay",
                                    phoneNumber: "0542533691",
                                    sum: "1",
                                    delegate: self)

    }
    
    private func settleSuspendedTransaction() {
        startAnimate()
        Meshulam.shared().settleSuspendedTransaction(apiKey: "cbf3b862e094",
                                                     userId: "41deb6f1347ee8b2",
                                                     sum: "1",
                                                     transactionId: transactionId,
                                                     delegate: self)
    }
    
    private func handleGetPaymentProcessInfo() {
        startAnimate()
        Meshulam.shared().getPaymentProcessInfo(processId: processId,
                                                processToken: processToken,
                                                delegate: self)
    }
    
    private func handleCancelBitTransaction() {
        startAnimate()
        Meshulam.shared().cancelBitTransaction(processId: processId,
                                               processToken: processToken,
                                               pageCode: "535dd4248592",
                                               delegate: self)
    }

    private func startAnimate() {
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        view.addSubview(spinner)
        
        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
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
    func onFailure(_ error: String) {
        //spinner.stopAnimating()
        showAlert(titiel: "error", message: "error: \(error)")
    }
    
    
    func createPaymentProccesSuccess(_ processId: String,_ processToken: String) {
        self.processId = processId
        self.processToken = processToken
        showAlert(titiel: "createPaymentProccesSuccess", message: "processId: \(processId)\n processToken: \(processToken)")
    }
    
    func setBitPaymentSuccess(_ transactionId: String) {
        self.transactionId = transactionId
        showAlert(titiel: "setBitPaymentSuccess", message: "transactionId: \(transactionId)")
    }

    func settleSuspendedTransactionSuccess(response: String) {
        spinner.stopAnimating()
        showAlert(titiel: "settleSuspendedTransactionSuccess", message: "response: \(response)")
    }
    
    func getPaymentProcessInfoSuccess(response: String) {
        spinner.stopAnimating()
        showAlert(titiel: "getPaymentProcessInfoSuccess", message: "response: \(response)")
    }

    func onCancel() {
        spinner.stopAnimating()
        showAlert(titiel: "onCancel", message: "onCancel")
    }
    
    private func showAlert(titiel: String, message: String) {
        let alert = UIAlertController(title: titiel, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Done", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

