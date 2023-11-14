//
//  Tweet.swift
//  twitter-clone (iOS)
//
//

import SwiftUI

struct Tweet: Identifiable, Decodable {
    let _id: String
    let text: String
    let userId: String
    let username: String
    let user: String
    var id: String {
        return _id
    }
    let image: String?
    var likes : [String]
    var didLike: Bool? = false
}
