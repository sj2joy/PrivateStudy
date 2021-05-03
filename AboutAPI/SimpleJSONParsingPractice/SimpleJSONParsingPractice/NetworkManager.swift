//
//  NetworkManager.swift
//  vjiodorqe
//
//  Created by mac on 2021/05/02.
//

import Foundation
import UIKit

struct NetworkManager {
    
    func getDustData(completion: @escaping ([Contact])->()) {
        guard let url = URL(string: "https://api.androidhive.info/contacts/") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                print(error?.localizedDescription)
                return
            }
            guard let data = data else { return }
            do {
                let result = try JSONDecoder().decode(Welcome.self, from: data)
                completion(result.contacts)
                print(result)
            } catch {
                
            }
        }.resume()
    }
    
}
