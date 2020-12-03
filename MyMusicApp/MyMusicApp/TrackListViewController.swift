//
//  ViewController.swift
//  MyMusicApp
//
//  Created by mac on 2020/10/24.
//  Copyright © 2020 Seokjin. All rights reserved.
//

import UIKit

/*
 - 트랙 모델 만들기
 - 트랙 리스트 만들기
 - tableviewdatasource, delegate
 - 커스텀 테이블뷰 셀
 - 뷰 구성하기
 */

class TrackListViewController: UIViewController {
    
    let tableView = UITableView()
    var musicTrackList: [Track] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TrackCell.self, forCellReuseIdentifier: "Cell")
        tableView.rowHeight = 80
        loadTrackList()
        setupUI()
    }
    
    func loadTrackList() {
        
        musicTrackList = [
        
        Track(title: "Swish", thumb:#imageLiteral(resourceName: "Swish"), artist: "Tyga"),
        Track(title: "Dip", thumb: #imageLiteral(resourceName: "Dip"), artist: "Tyga"),
        Track(title: "The Harlem Barber Swing", thumb: #imageLiteral(resourceName: "The Harlem Barber Swing"), artist: "Jazzinuf"),
        Track(title: "Believer", thumb: #imageLiteral(resourceName: "Believer"), artist: "Imagine Dragon"),
        Track(title: "Blue Birds", thumb: #imageLiteral(resourceName: "Blue Birds"), artist: "Eevee"),
        Track(title: "Best Mistake", thumb: #imageLiteral(resourceName: "Best Mistake"), artist: "Ariana Grande"),
        Track(title: "thank u, next", thumb: #imageLiteral(resourceName: "thank u, next"), artist: "Ariana Grande"),
        Track(title: "7 rings", thumb: #imageLiteral(resourceName: "7 rings"), artist: "Ariana Grande"),
    
    ]}
    
    private func setupUI() {
        tableView.frame = view.frame
        tableView.backgroundColor = .white
        view.addSubview(tableView)
    }
}


//MARK: - TableViewDataSource
extension TrackListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicTrackList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? TrackCell else {
            return UITableViewCell()
        }

        let track = musicTrackList[indexPath.row]
        cell.thumbnail.image = track.thumb
        cell.artistLabel.text = track.artist
        cell.titleLabel.text = track.title
        
        return cell

    }
    
}

//MARK: - TableViewDataSource
extension TrackListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Title: \(musicTrackList[indexPath.row].title), Artist:\(musicTrackList[indexPath.row].artist)")
        
        let playerVC = PlayerViewController()
        playerVC.modalPresentationStyle = .fullScreen
        playerVC.track = musicTrackList[indexPath.row]
        
        present(playerVC, animated: true)
        
    }
    
}
