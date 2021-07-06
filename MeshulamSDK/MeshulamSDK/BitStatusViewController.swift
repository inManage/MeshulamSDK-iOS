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
    
    private var animationView: AnimationView?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureAnimateView()
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
        self.dismiss(animated: true)
    }
}
