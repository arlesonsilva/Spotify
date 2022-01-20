//
//  SettingsModel.swift
//  Spotify
//
//  Created by Arleson Silva on 20/01/22.
//

import Foundation

struct Section {
    let title: String
    let options: [Option]
}

struct Option {
    let title: String
    let handler: () -> Void
}
