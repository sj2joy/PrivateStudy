//
//  ViewController.swift
//  ImageSlideShowTutorial
//
//  Created by mac on 2020/11/10.
//

import UIKit
import ImageSlideshow

class MainViewController: UIViewController {
    
    let topImageView = ImageSlideshow()
    let bottomImageView = ImageSlideshow()
    let labelPageIndicator = LabelPageIndicator()
    let labelPageBackgroundView = UIView()
    let imageResources = [
        
        KingfisherSource(urlString: "https://search.pstatic.net/common/?src=http%3A%2F%2Fimgnews.naver.net%2Fimage%2F5120%2F2019%2F04%2F15%2F0000109378_001_20190415014402954.png&type=b400", placeholder: UIImage(systemName: "photo")?.withTintColor(.darkGray, renderingMode: .alwaysOriginal), options: .none)!,
        
        KingfisherSource(urlString: "https://search.pstatic.net/common/?src=http%3A%2F%2Fpost.phinf.naver.net%2FMjAxNzA1MTNfMTMz%2FMDAxNDk0NjU4MzM0ODI4.TAov9gIr_DeHDyDd0ostdIg43bXg7Jn-85SFv6nNOWQg.UIvFU5G6C3FGNCoqfNmHKj2yte0KNA_Qvy6eqX_LMb4g.JPEG%2FIDfMKmesl27xiFzUQqClb7C0vQLM.jpg&type=sc960_832", placeholder: UIImage(systemName: "photo")?.withTintColor(.darkGray, renderingMode: .alwaysOriginal),  options: .none)!,
        
        KingfisherSource(urlString: "https://search.pstatic.net/common/?src=http%3A%2F%2Fcafefiles.naver.net%2FMjAxOTEwMDNfNjcg%2FMDAxNTcwMDUwODcwMDQ4.LFB5nQqolzRn8jYn5WjggDfdbL50jICX8t9fbAq9rkAg.E6rVP17g7M76RYOEw7tZ7dIMVQls6suxDdpQsjxVvRwg.JPEG%2FexternalFile.jpg&type=b400", placeholder: UIImage(systemName: "photo")?.withTintColor(.lightGray, renderingMode: .alwaysOriginal), options: .none)!,
        
        
        KingfisherSource(urlString: "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2F20130114_219%2Fjohh340_1358097820464Ljxlo_JPEG%2FFC_%25B9%25D9%25B8%25A3%25BC%25BF%25B7%25CE%25B3%25AA.jpg&type=b400", placeholder: UIImage(systemName: "photo")?.withTintColor(.lightGray, renderingMode: .alwaysOriginal), options: .none)!,
        
        KingfisherSource(urlString: "https://search.pstatic.net/common/?src=http%3A%2F%2Fimgnews.naver.net%2Fimage%2F014%2F2012%2F03%2F05%2F20120305102956379.jpg&type=sc960_832", placeholder: UIImage(systemName: "photo")?.withTintColor(.darkGray, renderingMode: .alwaysOriginal), options: .none)!
        
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    func setupUI() {
        topImageView.frame = CGRect(x: view.frame.minX, y: view.frame.minY, width: view.frame.width, height: view.frame.height / 2)
        topImageView.backgroundColor = .systemTeal
        topImageView.slideshowInterval = 1
        topImageView.contentScaleMode = .scaleAspectFill
        labelPageIndicator.textColor = .black
        //topImageView.pageIndicatorPosition = .init(horizontal: .left(padding: 10 ), vertical: .bottom )
        topImageView.setImageInputs(imageResources)
        view.addSubview(topImageView)
        
        bottomImageView.frame = CGRect(x: view.frame.minX, y: view.frame.maxY / 2, width: view.frame.width, height: view.frame.height / 2)
        bottomImageView.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        bottomImageView.slideshowInterval = 2.5
        bottomImageView.pageIndicator = labelPageIndicator
        bottomImageView.setImageInputs(imageResources)
        bottomImageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapGesture(_:)))
        bottomImageView.addGestureRecognizer(tapGesture)
        view.addSubview(bottomImageView)
        
    
        
        
        //        labelPageBackgroundView.frame = CGRect(x: labelPageIndicator.frame.maxX * 0.5,
//                                               y: labelPageIndicator.frame .maxY - 40,
//                                               width: labelPageIndicator.frame.width * 1.2,
//                                               height: labelPageIndicator.frame.height * 1.2)
//        labelPageBackgroundView.backgroundColor = .yellow
//        labelPageBackgroundView.layer.cornerRadius = 15
//        labelPageBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        //         NSLayoutConstraint.activate([
        //            labelPageBackgroundView.centerXAnchor.constraint(equalTo: labelPageIndicator.centerXAnchor),
        //            labelPageBackgroundView.centerYAnchor.constraint(equalTo: labelPageIndicator.centerYAnchor),
        //            labelPageBackgroundView.widthAnchor.constraint(equalTo: labelPageIndicator.widthAnchor, multiplier: 1.2),
        //            labelPageBackgroundView.heightAnchor.constraint(equalTo: labelPageIndicator.heightAnchor, multiplier: 1.2),
        //        ])
        
//        view.addSubview(bottomImageView)
    }
    @objc func didTapGesture(_ sender: UITapGestureRecognizer? = nil) {
        print("didTapGesture has called")
        let fullScreenController = bottomImageView.presentFullScreenController(from: self, completion: nil)
    }
}

