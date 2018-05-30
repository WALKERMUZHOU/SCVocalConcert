//
//  UIViewUtil.swift
//  SCVocalConcertTool
//
//  Created by walkermuzhou on 2018/5/22.
//  Copyright © 2018年 walkermuzhou. All rights reserved.
//

import UIKit

extension UIView{
    
    //x
    var x : CGFloat!{
        
        get {
            return frame.origin.x
            
        }
        
        set(newValue) {
            var tempFrame : CGRect = frame
            tempFrame.origin.x = newValue
            frame = tempFrame
        }
    }
    
    // y
    var y : CGFloat!{
        
        get {
            return frame.origin.y
            
        }
        
        set(newValue) {
            var tempFrame : CGRect  = frame
            tempFrame.origin.y = newValue
            frame = tempFrame
        }
    }
    
    // width
    var kWidth : CGFloat!{
        
        get {
            return frame.width
            
        }
        
        set(newValue) {
            var tempFrame : CGRect  = frame
            tempFrame.size.width = newValue
            frame = tempFrame
        }
    }
    
    // height
    var kHeight : CGFloat!{
        
        get {
            return frame.height
            
        }
        
        set(newValue) {
            var tempFrame : CGRect  = frame
            tempFrame.size.height = newValue
            frame = tempFrame
        }
    }
    
    // centerX
    var kCenterX : CGFloat!{
        
        get {
            return center.x
            
        }
        
        set(newValue) {
            center = CGPoint(x: newValue, y: center.y)
        }
    }
    
    // centerY
    var kCenterY : CGFloat!{
        
        get {
            return center.y
            
        }
        
        set(newValue) {
            center = CGPoint(x: center.x, y: newValue)
        }
        
    }
    
    // right
    var kRight : CGFloat!{
        
        get {
            return x + kWidth
            
        }
        
        set(newValue) {
            var tempFrame : CGRect  = frame
            tempFrame.origin.x = newValue - tempFrame.size.width
            frame = tempFrame
        }
    }
    
    // bottom
    var kBottom : CGFloat!{
        
        get {
            return y + kHeight
        }
        
        set(newValue) {
            var tempFrame : CGRect  = frame
            tempFrame.origin.y = newValue - tempFrame.size.height
            frame = tempFrame
        }
    }
    
    //coordinate
    var coordinate : CGPoint{
        
        get {
            return frame.origin
            
        }
        
        set(newValue) {
            var tempFrame : CGRect = frame
            tempFrame.origin.x = newValue.x
            tempFrame.origin.y = newValue.y
            frame = tempFrame
            
        }
    }
}
