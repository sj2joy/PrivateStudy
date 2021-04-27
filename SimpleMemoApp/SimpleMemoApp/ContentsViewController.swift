//
//  ContentsViewController.swift
//  SimpleMemoApp
//
//  Created by mac on 2021/04/25.
//

import UIKit

class ContentsViewController: UIViewController {
    
    let textView = UITextView()
    let imageView = UIImageView()
    var subject: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        textView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let cameraButton = UIBarButtonItem(image: UIImage(systemName: "camera"), style: .done, target: self, action: #selector(didTabCameraButton(_:)))
        let saveButton = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(didTabSaveButton(_:)))
        navigationItem.rightBarButtonItems = [cameraButton, saveButton]
        title = "Contents Write"
    }
    
    func setupUI() {
        view.addSubview(imageView)
        imageView.backgroundColor = .systemYellow
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 300),
            imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            imageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -80),
        ])
        
        view.addSubview(textView)
        textView.backgroundColor = .systemGray
        textView.isEditable = true
        textView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            textView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            textView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            textView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    @objc private func didTabCameraButton(_ sender: UIBarButtonItem) {
        print("select picture")
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        self.present(picker, animated: true, completion: nil)
    }
    
    @objc private func didTabSaveButton(_ sender: UIBarButtonItem) {
        print("didTab")
        let data = MemoModel()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.memoList.append(data)
        data.title = self.subject
        data.contents = self.textView.text
        data.image = self.imageView.image
        data.date = Date()
        let alert = UIAlertController(title: "저장하시겠습니까?", message: nil, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            print("Cancel")
        }
        let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
            print("Save")
            self.navigationController?.popViewController(animated: true)
        }
        alert.addAction(cancelAction)
        alert.addAction(saveAction)
        present(alert, animated: true)
    }
}

//MARK: - UIImagePickerDelegate

extension ContentsViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        self.imageView.image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        picker.dismiss(animated: false, completion: nil)
    }
}

//MARK: - UITextViewDelegate

extension ContentsViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        let contents = textView.text as NSString
        let length = ((contents.length > 15) ? 15 : contents.length)
        self.subject = contents.substring(with: NSRange(location: 0, length: length))
        self.navigationItem.title = subject
    }
}


//MARK: - UINavigationController

extension ContentsViewController: UINavigationControllerDelegate {
    
}


