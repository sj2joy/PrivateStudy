//
//  Users.swift
//  vjiodorqe
//
//  Created by mac on 2021/05/02.
//

import Foundation

struct Welcome: Decodable {
    let contacts: [Contact]
}
struct Contact: Decodable {
    let id, name, email: String
}
