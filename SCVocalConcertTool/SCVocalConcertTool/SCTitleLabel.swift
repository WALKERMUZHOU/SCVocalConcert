//
//  SCTitleLabel.swift
//  SCVocalConcertTool
//
//  Created by walkermuzhou on 2018/5/21.
//  Copyright © 2018年 walkermuzhou. All rights reserved.
//

import UIKit

class SCTitleLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.textColor = UIColor.white
        self.font = UIFont.boldSystemFont(ofSize: 14)
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
