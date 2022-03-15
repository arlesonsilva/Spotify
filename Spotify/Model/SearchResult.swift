//
//  SearchResult.swift
//  Spotify
//
//  Created by Arleson Silva on 15/03/22.
//

import Foundation

enum SearchResult {
    case artist(model: Artist)
    case album(model: Album)
    case track(model: AudioTrack)
    case playlist(model: Playlist)
}
