//
//  SCSettingAlertView.swift
//  SCVocalConcertTool
//
//  Created by walkermuzhou on 2018/5/22.
//  Copyright © 2018年 walkermuzhou. All rights reserved.
//

import UIKit

public typealias SpeedBlock = (_ currentSpeed: Float) -> Void
public typealias FontSizeBlock = (_ fontSize: Int) -> Void
public typealias FontStringBlock = (_ fontString: String) -> Void
public typealias ColorBlock = (_ color: UIColor) -> Void


class SCSettingAlertView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    let speedArray = ["0","0.5x","1.0x","1.5x","2.0x"]
    let fontArray = ["PingFangSC-Regular","HannotateSC-W7","DFPWaWaW7-B5","PingFangSC-Medium","YuppySC-Regular"]
    let fontSizeArray = ["MAX","36","50","70","90","110"]
    
    let colorArray = [UIColor.red,UIColor.blue,UIColor.brown,UIColor.cyan,UIColor.purple,UIColor.white]

    public var speedBlock: SpeedBlock?
    public var fontSizeBlock: FontSizeBlock?
    public var fontStringBlock: FontStringBlock?
    public var colorBlock: ColorBlock?

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        self.alpha = 0.7;
        ceateUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func ceateUI(){
        let speedLabel = SCTitleLabel(frame: CGRect(x: 20, y: 22, width: 100, height: 20))
        speedLabel.text = "速度"
        self.addSubview(speedLabel)
        
        for index in 0...self.speedArray.count-1 {
            let button = SCButton()
            button.frame = CGRect(x: CGFloat(15 + index * 60), y: CGFloat(speedLabel.frame.origin.y + 27), width: 50, height: 50)
            button.setTitle(self.speedArray[index], for: .normal)
            button.tag = 1000+index
            button.addTarget(self, action: #selector(speedClick(sender:)), for: .touchUpInside)
            if index == 0{
                button.isChooseed = true
            }else{
                button.isChooseed = false
            }
            self.addSubview(button)
        }
        
        let sizeLabel = SCTitleLabel(frame: CGRect(x: 20, y: speedLabel.frame.origin.y + 27 + 50 + 13, width: 100, height: 20))
        sizeLabel.text = "字号"
        self.addSubview(sizeLabel)
        
        for index in 0...self.fontSizeArray.count - 1 {
            let button = SCButton()
            button.frame = CGRect(x: CGFloat(15 + index * 60), y: CGFloat(sizeLabel.frame.origin.y + 27), width: 50, height: 50)
            button.setTitle("\(self.fontSizeArray[index])", for: .normal)
            button.tag = 2000 + index
            button.addTarget(self, action: #selector(fontSizeClick(sender:)), for: .touchUpInside)
            if index == 0{
                button.isChooseed = true
            }else{
                button.isChooseed = false
            }
            self.addSubview(button)
        }
        
        let fontLabel = SCTitleLabel(frame: CGRect(x: 20, y: sizeLabel.frame.origin.y + 27 + 50 + 13, width: 100, height: 20))
        fontLabel.text = "字体"
        self.addSubview(fontLabel)
    
        for index in 0...self.fontArray.count - 1 {
            let button = SCButton()
            button.frame = CGRect(x: CGFloat(15 + index * 60), y: CGFloat(fontLabel.frame.origin.y + 27), width: 50, height: 50)
            button.setTitle("字体", for: .normal)
            button.tag = 3000 + index
            button.titleLabel?.font = UIFont.init(name: self.fontArray[index], size: 14)
            button.addTarget(self, action: #selector(fontStringClick(sender:)), for: .touchUpInside)
            if index == 0{
                button.isChooseed = true
            }else{
                button.isChooseed = false
            }
            self.addSubview(button)
        }
        
        let colorLabel = SCTitleLabel(frame: CGRect(x: 20, y: fontLabel.frame.origin.y + 27 + 50 + 13, width: 100, height: 20))
        colorLabel.text = "颜色"
        self.addSubview(colorLabel)
        
        
        
        for index in 0...self.colorArray.count - 1 {
            let button = SCButton()
            button.frame = CGRect(x: CGFloat(15 + index * 60), y: CGFloat(colorLabel.frame.origin.y + 27), width: 50, height: 50)
            button.backgroundColor = self.colorArray[index]
            button.tag = 4000 + index
            button.addTarget(self, action: #selector(colrClick(sender:)), for: .touchUpInside)

            if index == 0{
                button.isChooseed = true
            }else{
                button.isChooseed = false
            }
            self.addSubview(button)
        }
    }
    
    @objc func speedClick(sender:UIButton) {

        let button = viewWithTag(sender.tag) as! SCButton?
        if button?.isChooseed == true {
            return
        }
        
        for index in 0...self.speedArray.count - 1 {
            let button = viewWithTag(1000 + index) as! SCButton?

            if index == sender.tag - 1000 {
                button?.isChooseed = true
            }else{
                button?.isChooseed = false
            }
        }
        
        if self.speedBlock != nil {
            self.speedBlock!(Float(sender.tag))
        }
    }
    
    
    @objc func fontSizeClick(sender:UIButton){
        let button = viewWithTag(sender.tag) as! SCButton?
        if button?.isChooseed == true {
            return
        }
        
        for index in 0...5 {
            let button = viewWithTag(2000 + index) as! SCButton?
            
            if index == sender.tag - 2000 {
                button?.isChooseed = true
            }else{
                button?.isChooseed = false
            }
        }
        
        let buttonFont = button?.titleLabel?.text
        if self.fontSizeBlock != nil {
            if buttonFont == "MAX" {
                //用0来标注maxFont
                self.fontSizeBlock!(0)
            }else{
                self.fontSizeBlock!(buttonFont!.toInt()!)
            }
        }
    }
    
    @objc func fontStringClick(sender:UIButton){
        let button = viewWithTag(sender.tag) as! SCButton?
        if button?.isChooseed == true {
            return
        }
        
        for index in 0...self.fontArray.count - 1 {
            let button = viewWithTag(3000 + index) as! SCButton?
            
            if index == sender.tag - 3000 {
                button?.isChooseed = true
            }else{
                button?.isChooseed = false
            }
        }
        
        if self.fontStringBlock != nil {
            self.fontStringBlock!(self.fontArray[sender.tag - 3000])
        }
    }
    
    @objc func colrClick(sender:UIButton){
        let button = viewWithTag(sender.tag) as! SCButton?
        if button?.isChooseed == true {
            return
        }
        
        for index in 0...self.colorArray.count - 1 {
            let button = viewWithTag(4000 + index) as! SCButton?
            
            if index == sender.tag - 4000 {
                button?.isChooseed = true
            }else{
                button?.isChooseed = false
            }
        }
        
        if self.colorBlock != nil {
            self.colorBlock!(self.colorArray[sender.tag - 4000])
        }
    }
    
    public func setFontSizeSelectMax(){
        for index in 0...self.fontSizeArray.count - 1 {
            let button = viewWithTag(2000 + index) as! SCButton?
            
            if index == 0 {
                button?.isChooseed = true
            }else{
                button?.isChooseed = false
            }
        }
    }

}
