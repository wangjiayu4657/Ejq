//
//  JYMusicTool.swift
//  Ejianqian
//
//  Created by wangjiayu on 2018/6/13.
//  Copyright © 2018年 wangjiayu. All rights reserved.
//

import UIKit

class JYMusicTool: NSObject {
    static var musicModel:JYMusicModel?
    
    static fileprivate let musics:[JYMusicModel] = {
        let path = Bundle.main.path(forResource: "Musics.plist", ofType: nil)
        var music:[JYMusicModel]?
        if let musicss = NSArray(contentsOfFile: path!) {
            for i in 0 ..< musicss.count {
                let dict = musicss[i] as! [String : AnyObject]
                music = [JYMusicModel(dict: dict)]
            }
        } else {
            music = [JYMusicModel]()
        }
        
       return music!
    }()
    
    static func playingMusic() -> JYMusicModel? {
        return musics.first
    }
    
//    /** 设置默认的音乐 */
//    + (void) setupPlayingMusic:(XWMusic *) playingMusic;
//
//    /** 播放上一首音乐 */
//    + (XWMusic *) playPreviousMusic;
//
//    /** 播放下一首音乐 */
//    + (XWMusic *) playNextMusic;
}


