//
//  Button.swift
//  StackViewPractice
//
//  Created by mac on 2021/04/11.
//

import Foundation
import UIKit

class Button: UIButton {
    
    let color = [#colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1),#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1),#colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1),#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1),#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupButton() {
        setTitleColor(.white, for: .normal)
        backgroundColor         = color.randomElement()
        titleLabel?.font        = UIFont(name: "Arial", size: 25)
        layer.cornerRadius      = 10
    }
  
}
