//
//  HomeViewController.swift
//  Ejianqian
//
//  Created by wangjiayu on 2018/6/13.
//  Copyright © 2018年 wangjiayu. All rights reserved.
//

import UIKit
import AVFoundation

class HomeViewController: UIViewController {
    
    @IBOutlet weak var priceView: UIView!
    @IBOutlet weak var diffPriceView: UIView!
    
    fileprivate var currentPlayer:AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
}


//布局UI界面
extension HomeViewController {
    func setupUI() {
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        let priceTap = UITapGestureRecognizer(target: self, action: #selector(priceTapAction))
        self.priceView.addGestureRecognizer(priceTap)
        
        let diffPriceTap = UITapGestureRecognizer(target: self, action: #selector(diffPriceTapAction))
        self.diffPriceView.addGestureRecognizer(diffPriceTap)
    }
    
}

//时间监听
extension HomeViewController {
    //播放音乐
    @objc func priceTapAction() {
        playMusic()
    }
    
    //停止播放音乐
    @objc func diffPriceTapAction () {
        stopMusic()
    }
}

//播放/停止音乐
extension HomeViewController {
    func playMusic() {
        if let jyMusic = JYMusicTool.playingMusic() {
            currentPlayer = JYAudioTool.playMusicWithFileName(fileName: jyMusic.filename!)
            currentPlayer?.delegate = self
        }
    }
    
    func stopMusic() {
        if let jyMusic = JYMusicTool.playingMusic() {
            JYAudioTool.stopMusicWithFileName(fileName: jyMusic.filename!)
        }
        currentPlayer?.pause()
    }
}

extension HomeViewController : AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        playMusic()
    }
}
