//
//  JYMusicModel.swift
//  Ejianqian
//
//  Created by wangjiayu on 2018/6/13.
//  Copyright © 2018年 wangjiayu. All rights reserved.
//

import UIKit

@objc class JYMusicModel: NSObject {
    @objc var name:String?
    @objc var filename:String?
    @objc var lrcname:String?
    @objc var singer:String?
    @objc var singerIcon:String?
    @objc var icon:String?
    
    init(dict:[String:AnyObject]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) { }
}
