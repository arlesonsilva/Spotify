//
//  Playlist.swift
//  Spotify
//
//  Created by Arleson Silva on 17/01/22.
//

import Foundation

struct Playlist: Codable {
    let description: String
    let external_urls: [String: String]
    let id: String
    let images: [APIImage]
    let name: String
    let owner: User
}
