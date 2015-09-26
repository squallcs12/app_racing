//
//  ActionButton.swift
//  App Racing
//
//  Created by Hat Dao on 9/26/15.
//  Copyright © 2015 Bang Dao. All rights reserved.
//

import UIKit

class ActionButton: UIButton {
    
    var number: Int? = nil;
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.whiteColor()
        self.addTarget(CodeViewController.instance, action: "buttonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    func setItemNumber(item: Int) {
        switch(item) {
        case 0:
            // up
            self.setImage(UIImage(named: "img/up.jpg"), forState: UIControlState.Normal)
            break
            
        case 1:
            self.setImage(UIImage(named: "img/left.png"), forState: UIControlState.Normal)
            break
            
        case 2:
            self.setImage(UIImage(named: "img/right.png"), forState: UIControlState.Normal)
            break
        default:
            break
        }
        self.number = item
    }
    
    func getCommand() -> String {
        switch(self.number!) {
        case 0:
            return "goStraight();"
        case 1:
            return "turnLeft();"
        case 2:
            return "turnRight();"
        default:
            break
        }
        return ""
    }

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
