//
//  Me.swift
//  Reddit
//
//  Created by Carson Katri on 8/13/19.
//  Copyright © 2019 Carson Katri. All rights reserved.
//

struct Me: Decodable {
    let name: String
    let id: String
    let comment_karma: Int
    let link_karma: Int
    let coins: Int
}
