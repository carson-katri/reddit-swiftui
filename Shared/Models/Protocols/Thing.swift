//
//  Thing.swift
//  Reddit
//
//  Created by Carson Katri on 8/15/19.
//  Copyright © 2019 Carson Katri. All rights reserved.
//

protocol Thing: Votable {
    var name: String { get }
    var id: String { get }
    var stickied: Bool { get }
}
