//
//  BitViewController.swift
//  MeshulamSDK
//
//  Created by Inmanage LTD on 22/06/2021.
//

import UIKit

 class BitViewController: UIViewController, UIAlertViewDelegate {

    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var exitBtn: UIButton!
    
    var priviosStatusBarColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setDelegats()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        priviosStatusBarColor = UIApplication.shared.statusBarUIView?.backgroundColor
        UIApplication.shared.statusBarUIView?.backgroundColor = UIColor.red
    }
    
    private func setDelegats() {
        PaymentManager.shared.delegate = self
    }
    
    private func setupUI() {
        titleLable.font = UIFont(name: "Heebo-Regular", size: 22)
    }
    
    @IBAction func didTapExit(_ sender: Any) {
        PaymentManager.shared.isTappedOnExitBtn = true
        UIApplication.shared.statusBarUIView?.backgroundColor = priviosStatusBarColor
        dismiss(animated: true, completion: nil)
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
        //TODO: Delete this delegate if not nedded!
    }
}
