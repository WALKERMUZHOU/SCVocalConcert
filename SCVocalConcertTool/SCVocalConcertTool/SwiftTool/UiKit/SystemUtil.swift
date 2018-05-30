//
//  SystemUtil.swift
//  SCVocalConcertTool
//
//  Created by walkermuzhou on 2018/5/22.
//  Copyright © 2018年 walkermuzhou. All rights reserved.
//

import Foundation
import UIKit

//当前系统版本
let kVersion = (UIDevice.current.systemVersion as NSString).floatValue
//      屏幕宽度
let kScreenWidth = UIScreen.main.bounds.width
//屏幕高度
let kScreenHeight = UIScreen.main.bounds.height
//状态栏高度
let kStatueBarHeight = UIApplication.shared.statusBarFrame.height
//导航栏高度
let kNavigationBarHeight = kStatueBarHeight + 44
//是否iPhone X
let iPhoneX = (kScreenWidth == 375 && kScreenHeight == 812 ? true : false)
//底部栏高度
let kBottomBarHeight = (iPhoneX ? 83 : 49)

//以6的比例设置
let kRatioToIP6H = kScreenWidth/667
let kRatioToIP6W = kScreenWidth/375


//MARK: -颜色方法
func RGBA (_ r:CGFloat,g:CGFloat,b:CGFloat,a:CGFloat)-> UIColor{
    return UIColor (red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}

//MARK: 不透明颜色
func RGBColor (_ r:CGFloat,g:CGFloat,b:CGFloat)-> UIColor{
    return UIColor (red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1)
}

//MARK: IOS 8以上
func IS_IOS8() -> Bool { return (UIDevice.current.systemVersion as NSString).doubleValue >= 8.0 }



// MARK:- 自定义打印方法
func LGJLog<T>(_ message : T, file : String = #file, funcName : String = #function, lineNum : Int = #line) {
    
    #if DEBUG
    
    let fileName = (file as NSString).lastPathComponent
    
    print("\(fileName):(\(lineNum))-\(message)")
    
    #endif
}
