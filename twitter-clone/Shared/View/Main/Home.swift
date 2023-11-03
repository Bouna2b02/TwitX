//
//  Home.swift
//  twitter-clone (iOS)
//
//  Created by cem on 7/31/21.
//

import SwiftUI

struct Home : View {
    
    @Binding var x : CGFloat
    @State var showCreateTweet = false
    @State var selectedIndex = 0
    
    let user: User
    
    var body: some View {
        
        // Home View With Custom Nav bar...
        
        VStack {
            
            //Spacer()
            
            ZStack {
                
                TabView {
                    
                    Feed(user: user)
                        .onTapGesture {
                            selectedIndex = 0
                        }.navigationBarHidden(true)
                        .navigationBarTitle("")
                        .tabItem {
                            
                            if (selectedIndex == 0) {
                                Image("Home").renderingMode(.template).foregroundColor(Color("bg"))
                            }
                            else {
                                Image("Home")
                            }
                            
                            
                        }.tag(0)
                    
                    SearchView()
                        .onTapGesture {
                            selectedIndex = 1
                        }.navigationBarHidden(true)
                        .navigationBarTitle("")
                        .tabItem {
                            
                            if (selectedIndex == 1) {
                                Image("Search").renderingMode(.template).foregroundColor(Color("bg"))
                            }
                            else {
                                Image("Search").renderingMode(.template).foregroundColor(Color("bg"))
                            }
                            
                            
                            
                        }.tag(1)
                    
                    NotificationsView(user: user)
                        .onTapGesture {
                            selectedIndex = 2
                        }.navigationBarHidden(true)
                        .navigationBarTitle("")
                        .tabItem {
                            
                            if (selectedIndex == 2) {
                                Image("Notifications").renderingMode(.template).foregroundColor(Color("bg"))
                            }
                            else {
                                Image("Notifications").renderingMode(.template).foregroundColor(Color("bg"))
                            }
                            
                            
                        }.tag(2)
                    
                    MessagesView()
                        .onTapGesture {
                            selectedIndex = 3
                        }.navigationBarHidden(true)
                        .navigationBarTitle("")
                        .tabItem {
                            
                            if (selectedIndex == 3) {
                                Image("Messages")
                            }
                            else {
                                Image("Messages").renderingMode(.template).foregroundColor(Color("bg"))
                            }
                            
                            
                        }.tag(3)
                    
                }.accentColor(.blue)
                .edgesIgnoringSafeArea(.top)
                
                VStack{
                    
                    Spacer()
                    
                    HStack{
                        
                        Spacer()
                        
                        Button(action: {
                            
                            self.showCreateTweet.toggle()
                            
                        }) {
                            
                            Image("tweet").renderingMode(.template).resizable().frame(width: 20, height: 20).padding()
                        }.background(Color("bg"))
                        .foregroundColor(.white)
                        .clipShape(Circle())
                        
                    }.padding()
                    
                }.padding(.bottom,65)
                
            }
            .sheet(isPresented: $showCreateTweet) {
                CreateTweet(show: self.$showCreateTweet, user: user)
            }
        }
        
        
        // for drag gesture...
        .contentShape(Rectangle())
        .background(Color.white)
    }
}


