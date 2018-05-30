//
//  SCColorTool.swift
//  SCVocalConcertTool
//
//  Created by walkermuzhou on 2018/5/21.
//  Copyright © 2018年 walkermuzhou. All rights reserved.
//

import UIKit
import Foundation

class SCColorTool: UIColor {
    /// 设置随机颜色
    class func UIColorRandom() -> UIColor
    {
        
        let color: UIColor = UIColor.init(red: (((CGFloat)((arc4random() % 256)) / 255.0)), green: (((CGFloat)((arc4random() % 256)) / 255.0)), blue: (((CGFloat)((arc4random() % 256)) / 255.0)), alpha: 1.0);
        return color;
    }
    
    /// 设置颜色（RGB：0.0~255.0） 示例：UIColorRGB(100, 100, 100)
    class func UIColorRGB(R:CGFloat, G:CGFloat, B:CGFloat) -> UIColor
    {
        return UIColorRGB_Alpha(R:R, G: G, B: B, alpha: 1.0);
    }
    
    /// 设置颜色与透明度（RGB：0.0~255.0；alpha：0.0~1.0） 示例：UIColorRGB_Alpha(100.0, 100.0, 20.0, 1.0)
    class func UIColorRGB_Alpha(R:CGFloat, G:CGFloat, B:CGFloat, alpha:CGFloat) -> UIColor
    {
        let color = UIColor.init(red: (R / 255.0), green: (G / 255.0), blue: (B / 255.0), alpha: alpha);
        return color;
    }
    

}

@objc extension UIColor{
    
    /// 设置颜色 示例：UIColorHex(0x26A7E8)
    class func UIColorHex(value:UInt32) -> UIColor
    {
        return UIColorHex_Alpha(value: value, alpha: 1.0);
    }
    
    /// 设置颜色与透明度 示例：UIColorHEX_Alpha(0x26A7E8, 0.5)
    class func UIColorHex_Alpha(value:UInt32, alpha:CGFloat) -> UIColor
    {
        let color = UIColor.init(red: (((CGFloat)((value & 0xFF0000) >> 16)) / 255.0), green: (((CGFloat)((value & 0xFF0000) >> 16)) / 255.0), blue: (((CGFloat)((value & 0xFF0000) >> 16)) / 255.0), alpha: alpha)
        return color
    }
}
