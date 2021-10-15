//
//  Item.swift
//  SearchMovie
//
//  Created by yeoboya on 2021/10/15.
//

import Foundation

struct Item: Codable {
    let title: String
    let link: String
    let image: String
    let subtitle: String
    let pubDate: String
    let director: String
    let actor: String
    let userRating: Double
}
