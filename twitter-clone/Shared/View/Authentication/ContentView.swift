//
//  ContentView.swift
//  Shared
//
//  Created by cem on 7/26/21.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        if viewModel.isAuthenticated {
            if let user = viewModel.currentUser {
                MainView(user: user)
            }
        }
        else {
            WelcomeView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
