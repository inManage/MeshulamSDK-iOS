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
        Meshulam.shared.delegate = self
        Meshulam.shared.userId   = "41deb6f1347ee8b2"
        Meshulam.shared.apiKey   = "cbf3b862e094"
        Meshulam.shared.pageCode = "a1a40d5ce46f"
    }
}

extension ViewController: MeshulamDelegate {
    func onSuccess() {
        //
    }

    func onFailure(_ error: Error) {
        print(error)
    }
}

