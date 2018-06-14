//
//  JYAudioTool.swift
//  Ejianqian
//
//  Created by wangjiayu on 2018/6/13.
//  Copyright © 2018年 wangjiayu. All rights reserved.
//

import UIKit
import AVFoundation


class JYAudioTool: NSObject {
    
    static var soundIDs = [String : Any]();
    static var players = [String : AVAudioPlayer]();
    
    // 播放音乐 fileName:音乐文件
    static func playMusicWithFileName(fileName:String) -> AVAudioPlayer? {
        var player = self.players[fileName]
        if player == nil {
            guard let fileUrl = Bundle.main.url(forResource: fileName, withExtension: nil) else { return nil }
            do{
                player = try AVAudioPlayer.init(contentsOf: fileUrl)
            }catch {
               print(error)
            }
            
            if let kPlayer = player {
                players[fileName] = kPlayer
            }
            
            player?.prepareToPlay()
        }
        
        player?.play()
        return player
    }
    
    // 暂停音乐 fileName:音乐文件
    static func pauseMusicWithFileName(fileName:String) {
        //从字典中取出播放器
        if let player = players[fileName] {
            player.pause()
        }
    }
    
    // 停止音乐 fileName:音乐文件
    static func stopMusicWithFileName(fileName:String) {
        var player = players[fileName]
        player?.stop()
        players.removeValue(forKey: fileName)
        player = nil
    }
    
    // 播放音效 soundName:音效文件
    static func playSoundWithSoundName(soundName:String) {
        var soundID:SystemSoundID = 0
        soundID = UInt32((soundIDs[soundName] as! CUnsignedInt))
        
        if soundID == 0 {
            guard let url = Bundle.main.url(forResource: soundName, withExtension: nil) as CFURL? else {return}
            AudioServicesCreateSystemSoundID(url, &soundID)
            soundIDs[soundName] = soundID
        }
        
        AudioServicesPlaySystemSound(soundID)
    }
}
