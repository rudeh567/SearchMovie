//
//  Total.swift
//  SearchMovie
//
//  Created by yeoboya on 2021/10/15.
//

import Foundation

struct ItemResult: Codable {
    let item: Item
}

struct ItemResponse: Codable {
    let items: ItemResult
    let total: String
    let start: String
    let display: String
}
