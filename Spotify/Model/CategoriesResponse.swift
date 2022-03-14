//
//  AllCategories.swift
//  Spotify
//
//  Created by Arleson Silva on 14/03/22.
//

import Foundation

struct CategoriesResponse: Codable {
    let categories: Categories
}

struct Categories: Codable {
    let items: [Category]
}

struct Category: Codable {
    let id: String
    let name: String
    let icons: [APIImage]
}
