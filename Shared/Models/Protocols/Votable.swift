//
//  Votable.swift
//  Reddit
//
//  Created by Carson Katri on 8/15/19.
//  Copyright © 2019 Carson Katri. All rights reserved.
//

protocol Votable {
    var score: Int { get }
    var likes: Bool? { get set }
}
