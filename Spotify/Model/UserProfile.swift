//
//  UserProfile.swift
//  Spotify
//
//  Created by Arleson Silva on 17/01/22.
//

import Foundation

struct UserProfile: Codable {
    let country: String
    let display_name: String
    let email: String
    let explicit_content: [String: Int]
    let external_urls: [String: String]
    let id: Int
    let product: String
    let images: [UserImage]
}

struct UserImage: Codable {
    let url: String
}
