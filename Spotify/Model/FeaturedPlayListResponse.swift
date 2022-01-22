//
//  FeaturedPlayListResponse.swift
//  Spotify
//
//  Created by Arleson Silva on 21/01/22.
//

import Foundation

struct FeturedPlayListResponse: Codable {
    let playlists: PlaylistResponse
}

struct PlaylistResponse: Codable {
    let items: [Playlist]
}
