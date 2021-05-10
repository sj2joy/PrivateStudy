//
//  ViewController.swift
//  AmazonProductPageYoutube
//
//  Created by mac on 2021/05/10.
//

import UIKit

struct TextCellViewModels {
    let text: String
    let font: UIFont
}

enum SectionType {
    case productPhotos(images: [UIImage])
    case productInfo(viewModels: [TextCellViewModels])
    case relatedProducts(viewModels: [RelatedProductTableViewCellModel])
    
    var title: String? {
        switch self {
        case .relatedProducts:
            return "Related Products"
        default:
            return nil
        }
    }
}

class MainViewController: UIViewController {
    
    let tableView = UITableView()
    private var sections = [SectionType]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSection()
        navigationItem.title = "Amazon"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.identifier)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(RelatedProductTableViewCell.self, forCellReuseIdentifier: RelatedProductTableViewCell.identifier)
        view.addSubview(tableView)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func configureSection() {
        sections.append(.productPhotos(images: [
            UIImage(named: "photo1"),
            UIImage(named: "photo2"),
            UIImage(named: "photo3"),
            UIImage(named: "photo4"),
        ].compactMap({ $0 })))
        sections.append(.productInfo(viewModels: [
            TextCellViewModels(text: "textcell viewmodels textcell viewmodels textcell viewmodels textcell viewmodels textcell viewmodels textcell viewmodels textcell viewmodels textcell viewmodels textcell viewmodels textcell viewmodels textcell viewmodels textcell viewmodels textcell viewmodels textcell viewmodels textcell viewmodels textcell viewmodels ",
                               font: .systemFont(ofSize: 18)),
            TextCellViewModels(text: "price: $511.99", font: .systemFont(ofSize: 22)),
        ]))
        sections.append(.relatedProducts(viewModels: [
            RelatedProductTableViewCellModel(image: UIImage(named: "related1"), title: "Product1"),
            RelatedProductTableViewCellModel(image: UIImage(named: "related2"), title: "Product2"),
            RelatedProductTableViewCellModel(image: UIImage(named: "related3"), title: "Product3"),
            RelatedProductTableViewCellModel(image: UIImage(named: "related4"), title: "Product4"),
        ].compactMap({ $0 })))
    }
}


//MARK: - UITableViewDelegate, UITableViewDataSource
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionType = sections[section]
        switch sectionType {
        case .productPhotos:
            return 1
        case .productInfo(let viewModel):
            return viewModel.count
        case .relatedProducts(let viewModel):
            return viewModel.count
        }
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionType = sections[section]
        return sectionType.title
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionType = sections[indexPath.section]
        switch sectionType {
        case .productPhotos(let images):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.identifier, for: indexPath) as? PhotosTableViewCell else {
                fatalError()
            }
            cell.configure(with: images)
            return cell
        case .productInfo(let viewModels):
            let viewModel = viewModels[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.configure(with: viewModel)
            return cell
        case .relatedProducts(let viewModels):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: RelatedProductTableViewCell.identifier, for: indexPath) as? RelatedProductTableViewCell else {
                fatalError()
            }
            cell.configure(with: viewModels[indexPath.row])
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let sectionType = sections[indexPath.section]
        switch sectionType {
        case .productPhotos:
            return view.frame.size.width
        case .productInfo:
            return UITableView.automaticDimension
        case .relatedProducts:
            return 150
        }
    }
}


//MARK: - UITableViewCell
extension UITableViewCell {
    func configure(with viewModel: TextCellViewModels) {
        textLabel?.text = viewModel.text
        textLabel?.numberOfLines = 0
        textLabel?.font = viewModel.font
    }
}
