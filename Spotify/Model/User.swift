//
//  User.swift
//  Spotify
//
//  Created by Arleson Silva on 22/01/22.
//

import Foundation

struct User: Codable {
    let display_name: String
    let external_urls: [String: String]
    let id: String
}
