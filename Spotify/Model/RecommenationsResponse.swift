//
//  RecommenationsResponse.swift
//  Spotify
//
//  Created by Arleson Silva on 22/01/22.
//

import Foundation

struct RecommendationsResponse: Codable {
    let tracks: [AudioTrack]
}
