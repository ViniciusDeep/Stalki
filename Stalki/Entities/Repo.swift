//
//  Repo.swift
//  Stalki
//
//  Created by Vinicius Mangueira on 08/11/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation

struct Repo: Decodable {
    let name: String
    let url: String
    let owner: User?
}
