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
        Meshulam.shared().configure(withParams: "a1a40d5ce46f",
                                    apiKey: "cbf3b862e094",
                                    userId: "41deb6f1347ee8b2")
    }
    
    @IBAction func didTapPayWithBit(_ sender: Any) {
        configureMeshulamSDK()
    }
}

extension ViewController: MeshulamDelegate {
    func onCancel() {
        print("onCancle")
    }
    
    func onSuccess() {
        //
    }

    func onFailure(_ error: Error) {
        print(error)
    }
}

