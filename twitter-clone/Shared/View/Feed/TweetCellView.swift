//
//  TweetView.swift
//  twitter-clone (iOS)
//
//  Created by cem on 7/31/21.
//

import SwiftUI
import Kingfisher

struct TweetCellView: View {
    
    @ObservedObject var viewModel: TweetCellViewModel
    var didLike: Bool { return viewModel.tweet.didLike ?? false }
    
    init(viewModel: TweetCellViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            
            // Cell Top
            
            HStack(alignment: .top, spacing: 10, content: {
                
                if let user = viewModel.user {
                    NavigationLink(destination: UserProfile(user: user)) {
                        KFImage(URL(string: "http://localhost:3000/users/\(self.viewModel.tweet.userId)/avatar"))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 55, height: 55)
                            .clipShape(Circle())
                            .padding(.leading, 8)
                    }
                }
                
                
                
                VStack(alignment: .leading, spacing: 10, content: {
                    
                    (
                        
                        Text("\(viewModel.tweet.username) ")
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                            
                            +
                            
                        Text("@\(viewModel.tweet.username)")
                            .foregroundColor(.gray)
                    )
                    
                    Text(viewModel.tweet.text)
                        .frame(maxHeight: 100, alignment: .top)
                    
                    if let imageId = viewModel.tweet.id {
                        if viewModel.tweet.image == "true" {
                            GeometryReader{ proxy in

                                KFImage(URL(string: "http://localhost:3000/tweets/\(imageId)/image"))
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: proxy.frame(in: .global).width, height: 250)
                                    .cornerRadius(15)
                            }
                            .frame(height: 250)
                        }
                    }
                    
                })
                Spacer()
                // Has been added after designing
            })
            
            
            // Cell Bottom
            
            
            HStack(spacing : 50) {
                
                Button(action: {
                    
                }) {
                    
                    Image("Comments").resizable().frame(width: 16, height: 16)
                    
                }.foregroundColor(.gray)
                
                Button(action: {
                    
                }) {
                    
                    Image("Retweet").resizable().frame(width: 18, height: 14)
                    
                }.foregroundColor(.gray)
                
                Button(action: {
                    if (self.didLike) {
                        print("it has not been liked")
                        viewModel.unlikeTweet()

                    }
                    else {
                        print("it has been liked")
                        viewModel.likeTweet()
                    }
                }) {
                    
                    if (self.didLike == false) {
                        Image("love").resizable().frame(width: 18, height: 15)
                    }
                    else {
                        Image("love").resizable().renderingMode(.template).foregroundColor(.red).frame(width: 18, height: 15)
                    }
                    
                }.foregroundColor(.gray)
                
                Button(action: {
                    
                }) {
                    
                    Image("upload").resizable().renderingMode(.template).frame(width: 16, height: 16)
                    
                }.foregroundColor(.gray)
            }
            .padding(.top, 4)
        }
    }
}

var sampleText = "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero's De Finibus Bonorum et Malorum for use in a type specimen book."
