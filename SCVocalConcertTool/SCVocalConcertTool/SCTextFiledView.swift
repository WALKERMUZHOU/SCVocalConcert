//
//  SCTextFiledView.swift
//  SCVocalConcertTool
//
//  Created by walkermuzhou on 2018/5/29.
//  Copyright © 2018年 walkermuzhou. All rights reserved.
//

import UIKit

typealias SettingButtonClickBlock = () -> Void
typealias TextFiledContentBlock = (_ content:String) -> Void

class SCTextFiledView: UIView,UITextFieldDelegate {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    private var textField = UITextField()
    public var settingBlock: SettingButtonClickBlock?
    public var contentBlock: TextFiledContentBlock?
    override init(frame: CGRect) {
        super.init(frame: frame)
        createUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createUI() {
        self.backgroundColor = .black

        self.textField = UITextField()
        self.textField.frame = CGRect(x: 20, y: 0, width: kScreenWidth - 44 - 20 - 20, height: 44)
        self.textField.placeholder = "请输入文字"
        self.textField.delegate = self
        self.textField.backgroundColor = .white
        self.textField.layer.cornerRadius = 22
        self.textField.layer.masksToBounds = true
        self.textField.returnKeyType = .done
        self.textField.distanceSides(20)
        self.addSubview(self.textField)
        
        let button = UIButton()
        button.frame = CGRect(x: self.textField.kRight + 20, y: 0, width: 44, height: 44*1200/1702)
        button.kCenterY = self.textField.kCenterY
        button.setBackgroundImage(UIImage(named: "setting"), for: .normal)
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(buttonClick(sender:)), for: .touchUpInside)
        self.addSubview(button)
    }

    @objc private func buttonClick(sender:UIButton){
        if self.settingBlock != nil{
            self.settingBlock!()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if self.contentBlock != nil {
            self.contentBlock!(textField.text!)
        }
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if self.contentBlock != nil {
            self.contentBlock!(textField.text!)
        }
    }
        
}
