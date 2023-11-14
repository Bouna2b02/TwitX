//
//  Profile.swift
//  twitter-clone (iOS)
//
//

import SwiftUI

class ProfileViewModel: ObservableObject {
    
    @Published var tweets = [Tweet]()
    @Published var user: User
    @Published var followersCount: Int = 0
    @Published var followingsCount: Int = 0
    
    init(user: User) {
        self.user = user

        fetchTweets()
        checkIfIsCurrentUser()
        checkIfUserIsFollowed()
    }
    
    func fetchTweets() {
        
        RequestServices.requestDomain = "http://localhost:3000/tweets/\(self.user.id)"
        
        RequestServices.fetchData { res in
            switch res {
                case .success(let data):
                    guard let tweets = try? JSONDecoder().decode([Tweet].self, from: data as! Data) else {
                        return
                    }
                    DispatchQueue.main.async {
                        self.tweets = tweets
                    }

                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
    
    func uploadProfileImage(text: String, image: UIImage?) {
        
        guard let user = AuthViewModel.shared.currentUser else { return }
        
        if let image = image {
            ImageUploader.uploadImage(paramName: "avatar", fileName: "image1", image: image, urlPath: "/users/me/avatar")
        }
    }
    
    func follow() {
        guard let authedUser = AuthViewModel.shared.currentUser else { return }
        
        RequestServices.requestDomain = "http://localhost:3000/users/\(self.user.id)/follow"
        
        RequestServices.followingProcess(id: self.user.id) { result in
            print(result)
            print("Followed")
        }
        RequestServices.requestDomain = "http://localhost:3000/notifications"
        RequestServices.sendNotification(username: authedUser.username, notSenderId: authedUser.id, notReceiverId: self.user.id, notificationType: NotificationType.follow.rawValue, postText: "") { result in
            print("FOLLOWED")
            print(result)
        }
        print("Followed")
        self.user.isFollowed = true
    }
    
    func unfollow() {
        RequestServices.requestDomain = "http://localhost:3000/users/\(self.user.id)/unfollow"
        
        RequestServices.followingProcess(id: self.user.id) { result in
            print(result)
            print("Unfollowed")
        }
        print("Unfollowed")
        self.user.isFollowed = false
    }
    
    func fetchFollowersCount() {
        guard let userId = AuthViewModel.shared.currentUser?.id else { return }

        let followersCountURL = "http://localhost:3000/users/\(userId)/followersCount"

        RequestServices.requestDomain = followersCountURL

        RequestServices.fetchData { result in
            switch result {
            case .success(let data):
                if let count = try? JSONDecoder().decode([String: Int].self, from: data as! Data) {
                    DispatchQueue.main.async {
                        self.followersCount = count["followersCount"] ?? 0
                    }
                }
            case .failure(let error):
                print("Error fetching followers count:", error.localizedDescription)
            }
        }
    }

    func fetchFollowingsCount() {
        guard let userId = AuthViewModel.shared.currentUser?.id else { return }

        let followingsCountURL = "http://localhost:3000/users/\(userId)/followingsCount"

        RequestServices.requestDomain = followingsCountURL

        RequestServices.fetchData { result in
            switch result {
            case .success(let data):
                if let count = try? JSONDecoder().decode([String: Int].self, from: data as! Data) {
                    DispatchQueue.main.async {
                        self.followingsCount = count["followingsCount"] ?? 0
                    }
                }
            case .failure(let error):
                print("Error fetching followings count:", error.localizedDescription)
            }
        }
    }
    
    func checkIfUserIsFollowed() {
//        if (self.tweet.likes.contains(self.currentUser.id)) {
//            self.tweet.didLike = true
//        }
//        else {
//            self.tweet.didLike = false
//        }
        
        if (self.user.followers.contains(AuthViewModel.shared.currentUser!._id)) {
            self.user.isFollowed = true
        }
        else {
            self.user.isFollowed = false
        }
    }
    
    func checkIfIsCurrentUser() {
        if (self.user._id == AuthViewModel.shared.currentUser?._id) {
            self.user.isCurrentUser = true
        }
    }
    
    func fetchUser(userId: String) {
        print(userId)
        
        let defaults = UserDefaults.standard
        AuthServices.requestDomain = "http://localhost:3000/users/\(userId)"
        
        AuthServices.fetchUser(id: userId) { res in
            switch res {
                case .success(let data):
                    guard let user = try? JSONDecoder().decode(User.self, from: data as! Data) else {
                        return
                    }
                    DispatchQueue.main.async {
                        defaults.setValue(user.id, forKey: "userid")
                        self.user = user
                        print(user)
                    }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
