//
//  CustomTableViewCell.swift
//  CustomDelegatePractice
//
//  Created by mac on 2021/04/10.
//

import Foundation
import UIKit

protocol CustomTableViewDelegate: AnyObject {
    func didTabButton(with string: String)
}

class CustomTableViewCell: UITableViewCell {
    
    weak var delegate: CustomTableViewDelegate?
    static let identifier = "CustomTableViewCell"
    let colors: [UIColor] = [#colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1),#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1),#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1),#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1),#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)]
    let btn = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(btn)
        btn.backgroundColor = colors.randomElement()
        btn.setTitle("Tab Me", for: .normal)
        btn.addTarget(self, action: #selector(didTabButton(_:)), for: .touchDown)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        btn.frame = CGRect(x: 10, y: 5, width: contentView.frame.size.width - 20, height: contentView.frame.size.height - 10)
    }
    @objc private func didTabButton(_ sender: UIButton) {
        guard let string = string else { return }
        delegate?.didTabButton(with: string)
    }
    private var string: String?
    
    public func configure(with string: String) {
        self.string = string
    }
}
