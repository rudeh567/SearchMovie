//
//  Total.swift
//  SearchMovie
//
//  Created by yeoboya on 2021/10/15.
//

import Foundation

struct ItemResponse: Codable {
    let items: [Item]
    let total: Int
    let start: Int
    let display: Int
}
