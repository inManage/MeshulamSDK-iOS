//
//  ExampleSwiftUIApp.swift
//  ExampleSwiftUI
//
//  Created by Omer Cohen on 09/05/2022.
//


import SwiftUI
import MeshulamSDK

@main

@available(iOS 14.0, *)
struct ExampleSwiftUIApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            MeshulamSimpleSwiftUIExmaple()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {

    var meshulam  : Meshulam!
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("Your code here")
        meshulam  = Meshulam.shared()
        meshulam.isDebugMode = true
        meshulam.meshulamStart()
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window!.makeKeyAndVisible()
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        Meshulam.shared().application(app, open: url, options: options)
        return true;
    }

}
