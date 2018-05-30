//
//  SCButton.swift
//  SCVocalConcertTool
//
//  Created by walkermuzhou on 2018/5/21.
//  Copyright © 2018年 walkermuzhou. All rights reserved.
//

import UIKit

class SCButton: UIButton {

    @objc public var isChooseed: Bool = false{
        didSet{
            if isChooseed == true{
                self.layer.borderWidth = 1
            }else{
                self.layer.borderWidth = 0
            }
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        self.setTitleColor(UIColor.white, for: .normal)
        self.backgroundColor = UIColor(hex6: 0x101010)
        self.layer.borderWidth = 0
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.cornerRadius = 25
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
