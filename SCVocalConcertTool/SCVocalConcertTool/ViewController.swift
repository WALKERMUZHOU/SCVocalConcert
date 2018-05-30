//
//  ViewController.swift
//  SCVocalConcertTool
//
//  Created by walkermuzhou on 2018/5/21.
//  Copyright © 2018年 walkermuzhou. All rights reserved.
//

import UIKit
import IQKeyboardManager
class ViewController: UIViewController {
    
    private var marqueeDisplayLink: CADisplayLink?
    private var alertView: SCSettingAlertView?
    private var textFiledView: SCTextFiledView?
    
    private let fontArray = ["PingFangSC-Regular","HannotateSC-W7","DFPWaWaW7-B5","WeibeiSC-Bold","PingFangSC-Medium","YuppySC-Regular"]
    private var isReversing = false
    
    private var label = UILabel()
    private var labelString: String = "请输入内容哈哈哈"
    private var labelColor: UIColor = .white
    private var fontString: String = "PingFangSC-Regular"
    private var fontSize: CGFloat  = 100
    private var speed: Int = 0
    
    private let textFieldHeight: CGFloat = 70
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black
        
        IQKeyboardManager.shared().isEnableAutoToolbar = false
        
        self.label = UILabel()
        self.label.frame = CGRect(x: 0, y: 0, width:kScreenHeight , height: kScreenWidth)
        self.label.text = self.labelString
        self.label.center = self.view.center
        self.label.textColor = .white
        self.label.numberOfLines = 0
        self.label.lineBreakMode = .byWordWrapping
        self.label.textAlignment = .center
        self.label.transform = CGAffineTransform.identity.rotated(by: CGFloat(Double.pi/2))
        self.label.font = UIFont(name: fontString, size:self.fontSize)
        self.view.addSubview(self.label)
        
        
        let tapGesture = UITapGestureRecognizer()
        tapGesture.addTarget(self, action: #selector(tapGesture(tap:)))
        self.view.addGestureRecognizer(tapGesture)
        
        self.alertView = SCSettingAlertView(frame: CGRect(x: 0, y: self.view.frame.size.height, width: self.view.frame.size.width, height: 375))
        
        self.alertView!.speedBlock = {(currentIndex) in
            self.changeSpeed(index: Int(currentIndex))
        }
        self.alertView!.fontSizeBlock = { (fontSize) in
            self.fontSizeChange(fontSize: fontSize)
        }
        self.alertView!.fontStringBlock = { (fontString) in
            self.fontStringChange(fontString: fontString)
        }
        self.alertView!.colorBlock = { (color) in
            self.labelColorChange(labelColor: color)
        }
        
        self.alertView?.isHidden = true
        self.view.addSubview(self.alertView!)

        self.textFiledView = SCTextFiledView(frame: CGRect(x: 0, y: kScreenHeight - self.textFieldHeight, width: kScreenWidth, height: self.textFieldHeight))
        self.textFiledView?.contentBlock = {(content) in
            
            if content == "" {
                return
            }else{
                self.labelString = content
                if self.speed == 0{
                    self.removeAnimation()
                    self.fontSize = CGFloat( self.caculateMaxFont(string: self.labelString)) - 5
                    self.alertView!.setFontSizeSelectMax()
                    self.setLabelFrameSizeCurrentSize()
                }else{
                    self.reSetLabelFrame()
                    self.reStartAnimation()
                }
            }
        }
        
        self.textFiledView?.settingBlock = {
            self.hideTextField()
            self.alertView!.isHidden = false

            self.view.bringSubview(toFront: self.alertView!)
            UIView.animate(withDuration: 0.3, animations: {
                self.alertView!.frame = CGRect(x: 0, y: self.view.frame.size.height -  375, width: self.view.frame.size.width, height: 375)
            }) { (complete) in
                if complete == true {
                }
            }
        }
        self.view.addSubview(self.textFiledView!)
        
    }

    @objc func tapGesture(tap:UIGestureRecognizer){
        if self.textFiledView!.isHidden == true {
            if self.alertView!.isHidden == false
            {
                self.view.bringSubview(toFront: self.alertView!)
                UIView.animate(withDuration: 0.3, animations: {
                    self.alertView!.frame = CGRect(x: 0, y: self.view.frame.size.height, width: self.view.frame.size.width, height: 375)
                }) { (complete) in
                    if complete == true {
                        self.alertView!.isHidden = true
                    }
                }
    
            }
            showTextField()
        }else{
            hideTextField()
        }
    }
    
    func showTextField() -> Void {
        self.textFiledView?.isHidden = false
        self.view.bringSubview(toFront: self.textFiledView!)
        UIView.animate(withDuration: 0.3) {
            self.textFiledView?.frame = CGRect(x: 0, y: kScreenHeight - self.textFieldHeight, width: kScreenWidth, height: self.textFieldHeight)
        }
    }
    
    func hideTextField() -> Void {
        
        self.view.endEditing(true)
        
        UIView.animate(withDuration: 0.5, animations: {
            self.textFiledView?.frame = CGRect(x: 0, y: kScreenHeight, width: kScreenWidth, height: self.textFieldHeight)
        }) { (complete) in
            self.textFiledView?.isHidden = true
        }
    }
    
    //MARK: 速度点击方法
    func changeSpeed(index:Int) -> Void {
        switch index {
        case 1000:do {
            self.speed = 0
            setLabelFrameSizeCurrentSize()
            self.removeAnimation()
        }
            break
        case 1001:do {
            self.removeAnimation()
            self.addAnimationWithSpeed(speed: 32)
        }
            break
        case 1002:do {
            self.removeAnimation()
            self.addAnimationWithSpeed(speed: 16)
        }
            break
        case 1003:do {
            self.removeAnimation()
            self.addAnimationWithSpeed(speed: 8)
        }
            break
        case 1004:do {
            self.removeAnimation()
            self.addAnimationWithSpeed(speed: 4)
        }
            break
        default: break
            
        }
    }
    
    public func addAnimationWithSpeed(speed:Int) -> (Void) {
        self.speed = speed

        self.reSetLabelFrame()
        self.reStartAnimation()

    }
    
    //MARK: 字体大小点击
    func fontSizeChange(fontSize:Int) -> Void {
        if fontSize == 0 {
            self.fontSize = CGFloat(self.caculateMaxFont(string: self.labelString))
        }else{
            self.fontSize = CGFloat(fontSize)
        }
        
        if self.speed == 0{
            self.removeAnimation()
            self.setLabelFrameSizeCurrentSize()
        }else{
            self.reSetLabelFrame()
            self.reStartAnimation()
        }
    }
    
    //MARK: 字体样式点击
    func fontStringChange(fontString:String) -> Void {
        self.fontString = fontString
        
        if self.speed == 0{
            self.removeAnimation()
            self.setLabelFrameSizeCurrentSize()
        }else{
            self.reSetLabelFrame()
            self.reStartAnimation()
        }
    }
    
    //MARK: 字体颜色点击
    func labelColorChange(labelColor:UIColor) -> Void {
        self.labelColor = labelColor
        if self.speed == 0{
            self.removeAnimation()
            self.setLabelFrameSizeCurrentSize()
        }else{
            self.reSetLabelFrame()
            self.reStartAnimation()
        }
    }
    
    //MARK: method
    public func removeAnimation() {
        self.label.layer.removeAllAnimations()
    }
    
    func reStartAnimation(){
        let delay = DispatchTime.now() + 0.1
        DispatchQueue.main.asyncAfter(deadline: delay) {
            let  anim = CABasicAnimation()
            // 描述下修改哪个属性产生动画
            // 只能是layer属性CGAffineTransformTranslate
            anim.keyPath = "transform.translation.y";
            //设置值
            anim.toValue = kScreenHeight + self.getLabelSize(sting: self.labelString).width
            // 设置动画执行次数
            anim.repeatCount = MAXFLOAT
            anim.duration = CFTimeInterval(self.speed)
            // 取消动画反弹
            //设置动画完成的时候不要移除动画
            anim.isRemovedOnCompletion = false;
            //设置动画执行完成要保持最新的效果
            anim.fillMode = kCAFillModeForwards;
            self.label.layer.add(anim, forKey: nil)
        }
    }
    
    func setLabelText(string:String) -> Void {
        if self.speed == 0 {
            let size = self.getLabelSize(sting: string)
            if size.width > kScreenWidth {
                
            }else{
                
                
                
                
            }
        }else{
            
        }
    }
    
    func setLabelFrameSizeCurrentSize() {
        self.label.removeFromSuperview()
        self.label = UILabel()
        self.label.frame = CGRect(x: 0, y: 0, width:kScreenHeight , height: kScreenWidth)
        self.label.text = self.labelString
        self.label.center = self.view.center
        self.label.textColor = self.labelColor
        self.label.numberOfLines = 0
        self.label.lineBreakMode = .byWordWrapping
        self.label.textAlignment = .center
        label.center = self.view.center
        self.label.transform = CGAffineTransform.identity.rotated(by: CGFloat(Double.pi/2))
        self.label.font = UIFont(name: fontString, size:self.fontSize)
        self.view.addSubview(self.label)
    }
    
    
    
    func reSetLabelFrame(){
        
        self.label.removeFromSuperview()
        
        self.label = UILabel()
        self.label.frame = CGRect(x: 0, y: 0, width:kScreenHeight , height: kScreenWidth)
        self.label.text = self.labelString
        self.label.center = self.view.center
        self.label.textColor = self.labelColor
        self.label.numberOfLines = 1
        self.label.lineBreakMode = .byWordWrapping
        self.label.textAlignment = .left
        let labelSize = self.getLabelSize(sting: self.label.text!)
        label.frame.size.width = labelSize.width
        label.kCenterY = -labelSize.width/2
        label.kCenterX = self.view.kCenterX
        self.label.transform = CGAffineTransform.identity.rotated(by: CGFloat(Double.pi/2))
        //        self.label.kCenterY = -kScreenHeight/2
        self.label.font = UIFont(name: fontString, size:self.fontSize)
        self.view.addSubview(self.label)

    }
    
    
    func getLabelSize(sting:String) -> CGSize {
        let statusLabelText: NSString = sting as NSString
        
        let stringSize = statusLabelText.boundingRect(with: CGSize(width: CGFloat(MAXFLOAT), height: CGFloat(MAXFLOAT)) , options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes:[NSAttributedStringKey.font: UIFont(name: self.fontString, size: self.fontSize) as Any], context: nil)
        return CGSize(width: stringSize.width, height: stringSize.height)
    }
    
    func caculateMaxFont(string: String) -> Int {
        let tempString = string as NSString

        let fontArray = NSMutableArray()
        for index in 0...28 {
            fontArray.add(20 + index * 10)
        }
        
        for index in 0...fontArray.count - 1 {
            let font: CGFloat = fontArray[index] as! CGFloat
            let stringSize = tempString.boundingRect(with: CGSize(width: CGFloat(kScreenWidth), height: CGFloat(MAXFLOAT)) , options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes:[NSAttributedStringKey.font: UIFont(name: self.fontString, size: font) ?? 100], context: nil)
            print("height:\(stringSize.height)")
            
            if stringSize.height > kScreenHeight - 80 {
                if index == 0 {
                    return fontArray[index] as! Int
                }
                return fontArray[index - 1] as! Int
            }
        }
        
        return fontArray.lastObject as! Int
        
    }
    
    
    func startMarquee() {
//        self.stopMarquee()
        self.marqueeDisplayLink = CADisplayLink.init(target: self, selector: #selector(processMarquee))
        self.marqueeDisplayLink?.preferredFramesPerSecond = Int(0.5)
        self.marqueeDisplayLink?.add(to: RunLoop.main, forMode: .commonModes)
    }
    
    @objc private func processMarquee() {
        var frame = self.label.frame
        
        let targetX = -(self.view!.bounds.size.width + 50)
        if frame.origin.x <= targetX {
            frame.origin.x = 0
            self.label.frame = frame
        }else {
            frame.origin.x -= 0.5
            if frame.origin.x < targetX {
                frame.origin.x = targetX
            }
            self.label.frame = frame
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

//extension ViewController{
//    /// 设置颜色 示例：UIColorHex(0x26A7E8)
//    @objc public func UIColorHex(value:UInt32) -> UIColor
//    {
//        return UIColorHex_Alpha(value: value, alpha: 1.0);
//    }
//    
//    /// 设置颜色与透明度 示例：UIColorHEX_Alpha(0x26A7E8, 0.5)
//    @objc public func UIColorHex_Alpha(value:UInt32, alpha:CGFloat) -> UIColor
//    {
//        let color = UIColor.init(red: (((CGFloat)((value & 0xFF0000) >> 16)) / 255.0), green: (((CGFloat)((value & 0xFF0000) >> 16)) / 255.0), blue: (((CGFloat)((value & 0xFF0000) >> 16)) / 255.0), alpha: alpha)
//        return color
//    }
//}
