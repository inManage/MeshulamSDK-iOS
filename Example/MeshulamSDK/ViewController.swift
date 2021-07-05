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

