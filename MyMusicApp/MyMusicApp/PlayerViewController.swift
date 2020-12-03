//
//  PlayerViewController.swift
//  MyMusicApp
//
//  Created by mac on 2020/10/26.
//  Copyright © 2020 Seokjin. All rights reserved.
//

import UIKit
import AVFoundation


class PlayerViewController: UIViewController {
    
    let thumbnail = UIImageView()
    let artistName = UILabel()
    let trackTitle = UILabel()
    
    let currentTimeLabel = UILabel()
    let totalTimeLabel = UILabel()
    
    let playPauseButton = UIButton()
    let timeSlider = UISlider()
    let closeButton = UIButton()
    
    var track: Track?
    var avplayer: AVPlayer?
    var timeObserver: Any?
    
    var currentTime: Double {
        return avplayer?.currentItem?.currentTime().seconds ?? 0
    }
    
    var totalTime: Double {
        return avplayer?.currentItem?.duration.seconds ?? 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        updateData()
        setupUI()
        prepareToPlay()
        //1초를 10개로 쪼개는?
        timeObserver = avplayer?.addPeriodicTimeObserver(forInterval: CMTime(value: 1, timescale: 10), queue: DispatchQueue.main) { time in
            self.updateTime(time: time)
        }
    }
    
    func updateData() {
        
        guard let currentTrack = track else { return }
        thumbnail.image = currentTrack.thumb
        artistName.text = currentTrack.artist
        trackTitle.text = currentTrack.title
        
    }
    
    func setupUI() {
        
        closeButton.frame = CGRect(x: view.layoutMargins.left + 20, y: view.layoutMargins.top + 60, width: 30, height: 30)
        closeButton.setImage(#imageLiteral(resourceName: "icClose"), for: .normal)
        closeButton.addTarget(self, action: #selector(didTabCloseButton(_:)), for: .touchUpInside)
        view.addSubview(closeButton)
        
        thumbnail.frame = CGRect(x: view.center.x - 110, y: view.center.y - 220, width: 230, height: 230)
        view.addSubview(thumbnail)
        
        trackTitle.frame = CGRect(x: view.center.x - 110, y: thumbnail.frame.maxY + 30, width: 230, height: 30)
        trackTitle.font = UIFont.boldSystemFont(ofSize: 20)
        trackTitle.textColor = .red
        trackTitle.textAlignment = .center
        view.addSubview(trackTitle)
        
        artistName.frame = CGRect(x: view.center.x - 110, y: trackTitle.frame.maxY + 20, width: 230, height: 25)
        artistName.textColor = .lightGray
        artistName.textAlignment = .center
        view.addSubview(artistName)
        
        timeSlider.frame = CGRect(x: view.center.x - 120 , y: artistName.frame.maxY + 40, width: 250, height: 10)
        timeSlider.tintColor = .darkGray
        timeSlider.value = 0
        timeSlider.addTarget(self, action: #selector(didTabDraggingButton(_:)), for: .valueChanged )
        timeSlider.addTarget(self, action: #selector(didTabEndDraggingButton(_:)), for: .touchUpInside)
        view.addSubview(timeSlider)
        
        currentTimeLabel.frame = CGRect(x: timeSlider.frame.minX, y: timeSlider.frame.maxY + 15, width: 50, height: 20)
        currentTimeLabel.textColor = .lightGray
        //        currentTimeLabel.backgroundColor = .blue
        currentTimeLabel.text = "\(secondsToString(sec: currentTime))"
        view.addSubview(currentTimeLabel)
        
        totalTimeLabel.frame = CGRect(x: timeSlider.frame.maxX - 50, y: timeSlider.frame.maxY + 15, width: 50, height: 20)
        totalTimeLabel.textColor = .lightGray
        totalTimeLabel.text = "\(secondsToString(sec: totalTime))"
        view.addSubview(totalTimeLabel)
        
        playPauseButton.setImage(#imageLiteral(resourceName: "icPlay"), for: .normal)
        playPauseButton.frame = CGRect(x: view.center.x - 15, y: totalTimeLabel.frame.maxY + 20, width: 30, height: 30)
        playPauseButton.addTarget(self, action: #selector(didTabPlayButton(_:)), for: .touchUpInside)
        view.addSubview(playPauseButton)
        
    }
    
    func prepareToPlay() {
        guard let currentTrack = track else { return }
        
        let asset = currentTrack.asset
        let playerItem = AVPlayerItem(asset: asset )
        let player = AVPlayer(playerItem: playerItem)
        avplayer = player
    }
    
    func updateTime(time: CMTime) {
//        print(time.seconds)
        currentTimeLabel.text = secondsToString(sec: currentTime)
        totalTimeLabel.text = secondsToString(sec: totalTime)
        
        if isSeeking == false {
            timeSlider.value = Float(currentTime / totalTime)
        }
    }
    
    func secondsToString(sec: Double) -> String {
        guard sec.isNaN == false else { return "00:00" }
        let totalSeconds = Int(sec)
        let min = totalSeconds / 60
        let seconds = totalSeconds % 60
        //%뒤에 값이 min, seconds가 들어간다는 표기법
        return String(format: "%02d:%02d", min, seconds)
        
    }
    
    func play() {
        avplayer?.play()
    }
    
    func pause() {
        avplayer?.pause()
    }
    
    func seek(to: Double) {
        let timeScale: CMTimeScale = 10
        let targetTime: CMTimeValue = CMTimeValue(to * totalTime) * CMTimeValue(timeScale)
        let time = CMTime(value: targetTime, timescale: timeScale)
        avplayer?.seek(to: time)
    }
    
    @objc private func didTabPlayButton(_ sender: UIButton) {
        let isPlaying = avplayer?.rate == 1
        
        if isPlaying {
            pause()
            playPauseButton.setImage( #imageLiteral(resourceName: "icPlay"), for: .normal)
        } else {
            play()
            playPauseButton.setImage(#imageLiteral(resourceName: "icPause"), for: .normal)
        }
    }
    @objc private func didTabCloseButton(_ sender: UIButton) {
        pause()
        avplayer?.replaceCurrentItem(with: nil)
        avplayer = nil
        
        dismiss(animated: true, completion: nil )
    }
    
    var isSeeking = false
    
    @objc private func didTabDraggingButton(_ sender: UISlider) {
        isSeeking = true
    }
    @objc private func didTabEndDraggingButton(_ sender: UISlider) {
        isSeeking = false
        seek(to: Double(sender.value))
    }
}
