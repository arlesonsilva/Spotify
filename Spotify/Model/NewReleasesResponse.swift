//
//  NewReleasesResponse.swift
//  Spotify
//
//  Created by Arleson Silva on 21/01/22.
//

import Foundation

struct NewReleasesResponse: Codable {
    let albums: AlbumsResponse
}

struct AlbumsResponse: Codable {
    let items: [Album]
}
