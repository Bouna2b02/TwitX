//
//  SearchView.swift
//  twitter-clone (iOS)
//
//

import SwiftUI

struct SearchView : View {
    
    @State var text = ""
    @State var isEditing = false
    
    var users: [User] {
        return text.isEmpty ? viewModel.users : viewModel.filteredUsers(text)
    }
    
    @ObservedObject var viewModel = SearchViewModel()
    
    var body : some View {
        
        VStack {
            
            ScrollView {
                SearchBar(text: $text, isEditing: $isEditing)
                    .padding(.horizontal)
                
                
                LazyVStack {
                    ForEach(users) { user in
                        NavigationLink(destination: UserProfile(user: user)) {
                            SearchUserCell(user: user)
                                .padding(.leading)
                        }
                    }
                }
            }
            
//            List(users) { user in
//                NavigationLink(destination: UserProfile(user: user)) {
//                    SearchUserCell(user: user)
//                }
//            }
            
//            if !isEditing {
//                List(0..<9) { i in
//                    SearchCell(tag: "hello", tweets: "hello")
//                }
//            }
//            else {
//
//                List(users) { user in
//                    SearchUserCell(user: user)
//                }
//
//                ForEach(users) { user in
//                    SearchUserCell(user: user)
//                }
//            }
        }
    }
}

struct SearchCell : View {
    
    var tag = ""
    var tweets = ""
    
    var body : some View{
        
        VStack(alignment : .leading,spacing : 5){
            
            Text(tag).fontWeight(.heavy)
            Text(tweets + " Tweets").fontWeight(.light)
        }
    }
}
