//
//  MyCustomSeguementControl.swift
//  CustomSeguement Control Tutorial
//
//  Created by mac on 2020/11/06.
//

import UIKit

protocol MyCustomSegmentControlDelegate: class {
    func segmentValueChanged(to index: Int)
}

class MyCustomSeguementControl: UIView {
    private var buttonTitles: [String]!
    private var buttons: [UIButton]!
    var textColor: UIColor = .systemTeal
    var selectedColor: UIColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
    public private(set) var selectedIndex: Int = 0
    var mySegmentDelegate: MyCustomSegmentControlDelegate?
    
    //기본적인 뷰
    override init(frame: CGRect) {
        super.init(frame: frame )
    }
    
    //데이터를 뷰에 적용할 때
    convenience init(frame: CGRect ,buttonTitles: [String]) {
        self.init(frame: frame  )
        self.buttonTitles = buttonTitles
        print("MySeguementControl - convenience init() called")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func draw(_ rect: CGRect) {
        super.draw(rect  )
        print("MySeguementControl - draw() called")
        updateView()
    }
    fileprivate func updateView() {
        print("MySeguementControl - updateView called ")
        
        //버튼 만들기
        createButton()
        //스택뷰 설정하기
        configStackView()
    }
    fileprivate func createButton() {
        print("MySeguementControl - createButton called")
        self.buttons = [UIButton]()
        //기존버튼들 다 지우는것
        self.buttons.removeAll()
        //하위뷰 다 지우는것
        self.subviews.forEach({$0.removeFromSuperview() })
        for buttonTitleItem in buttonTitles {
            let button = UIButton(type: .system)
            button.backgroundColor = .white
            button.titleLabel?.textColor = .black
            button.layer.borderWidth = 1
            button.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            button.layer.cornerRadius = 15
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            button.titleLabel?.minimumScaleFactor = 0.5 //50퍼센트까지
            button.titleLabel?.adjustsFontSizeToFitWidth = true
            button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            button.setTitle(buttonTitleItem, for: .normal)
            button.setTitleColor(textColor, for: .normal)
            button.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
            self.buttons.append(button)
        }
        //선택된 버튼 설정
        buttons[0].setTitleColor(.white, for: .normal)
        buttons[0].backgroundColor = selectedColor
    }
    fileprivate func configStackView() {
        print("MySeguementControl - configStackView called")
        let stackView = UIStackView(arrangedSubviews: buttons)
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        self.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
    @objc func buttonAction(_ sender: UIButton) {
        print("MySeguementControl - buttonAction called")
        for (buttonIndex, btn) in buttons.enumerated() {
            btn.setTitleColor(textColor, for: .normal)
            if btn == sender {
                self.selectedIndex = buttonIndex
                mySegmentDelegate?.segmentValueChanged(to: self.selectedIndex)
                btn.backgroundColor = selectedColor
                btn.setTitleColor(.white, for: .normal)
            } else {
                btn.backgroundColor = .white
                btn.setTitleColor(textColor, for: .normal  )
            }
        }
        print("MySeguementControl - buttonAction called, selectedIndex - \(self.selectedIndex)")
    }
}
 
