//
//  CreateTweetViewModel.swift
//  twitter-clone (iOS)
//
//  Created by cem on 8/10/21.
//

import SwiftUI

class CreateTweetViewModel: ObservableObject {
    
    func uploadPost(text: String, image: UIImage?) {
        
        guard let user = AuthViewModel.shared.currentUser else { return }
        
        RequestServices.requestDomain = "http://localhost:3000/tweets"
        
        RequestServices.postTweet(text: text, user: user.name, username: user.username, userId: user.id) { res in
            
//            guard let tweets = try? JSONDecoder().decode(Tweet.self, from: res) else {
//                return
//            }
//            print(tweets)
            if let image = image {
                if let id = res?["_id"]! {
                    print(id)
                    ImageUploader.uploadImage(paramName: "upload", fileName: "image1", image: image, urlPath: "/uploadTweetImage/\(id)")
                    print("/uploadTweetImage/\(id)")
                }
            }
        }
    }
}
