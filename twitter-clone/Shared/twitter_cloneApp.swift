//
//  twitter_cloneApp.swift
//  Shared
//

import SwiftUI

@main
struct twitter_cloneApp: App {
    
    init() {
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(AuthViewModel.shared)
//                .onAppear {
//                    let defaults = UserDefaults.standard
//                    defaults.removeObject(forKey: "jsonwebtoken")
//                    defaults.removeObject(forKey: "userid")
//                }
//                .onAppear {
//                    let defaults = UserDefaults.standard
//                    let token = defaults.object(forKey: "jsonwebtoken")
//                    print("The token is \(token!)")
//                }
//                .onAppear {
//                    UserDefaults.resetStandardUserDefaults()
//                }
        }
    }
}
