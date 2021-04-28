//
//  PersonFollowingTableViewCellViewModel.swift
//  MVVMPractice
//
//  Created by mac on 2021/04/18.
//

import UIKit

struct PersonFollowingTableViewCellViewModel {
    
    let name: String
    let userName: String
    var currentlyFollowing: Bool
    let image: UIImage?
        
    init(with model: Person) {
        self.name = model.name
        self.userName = model.userName
        self.currentlyFollowing = false
        self.image = UIImage(systemName: "person")
    }
    
}
