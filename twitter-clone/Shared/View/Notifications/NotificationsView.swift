//
//  NotificationsView.swift
//  twitter-clone (iOS)
//
//  Created by cem on 8/1/21.
//

import SwiftUI

struct NotificationsView: View {
    
    let user: User
    
    @ObservedObject var viewModel: NotificationsViewModel
    
    init (user: User) {
        self.user = user
        self.viewModel = NotificationsViewModel(user: user)
    }
    var body: some View {
        VStack {
            ScrollView {
                ForEach(viewModel.notifications) { not in
                    
                    NotificationCell(notification: not)
                    
                } 
            }
        }
    }
}

