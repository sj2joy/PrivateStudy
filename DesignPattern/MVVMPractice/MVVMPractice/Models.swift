//
//  Models.swift
//  MVVMPractice
//
//  Created by mac on 2021/04/18.
//

import UIKit

enum Gender {
    case male, female, unspecified
}

struct Person {
    let name: String
    let birthdate: Date?
    let middleName: String?
    let address: String?
    let gender: Gender
    
    var userName = "Talor Swift"
    
    init(name: String, birthdate: Date? = nil, middleName: String? = nil, address: String? = nil, gender: Gender = .unspecified) {
        self.name = name
        self.birthdate = birthdate
        self.middleName = middleName
        self.address = address
        self.gender = gender
    }
    
}
