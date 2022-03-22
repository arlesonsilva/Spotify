//
//  LibraryAlbumsResponse.swift
//  Spotify
//
//  Created by Arleson Silva on 22/03/22.
//

import Foundation

struct LibraryAlbumsResponse: Codable {
    let items: [SavedAlbum]
}

struct SavedAlbum: Codable {
    let added_at: String
    let album: Album
}
