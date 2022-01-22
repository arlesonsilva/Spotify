//
//  Artist.swift
//  Spotify
//
//  Created by Arleson Silva on 17/01/22.
//

import Foundation

struct Artist: Codable {
    let id: String
    let name: String
    let type: String
    let external_urls: [String: String]
}
