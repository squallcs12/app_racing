//
//  ActionCollectionViewCell.swift
//  App Racing
//
//  Created by Hat Dao on 9/26/15.
//  Copyright © 2015 Bang Dao. All rights reserved.
//

import UIKit

class ActionCollectionViewCell: UICollectionViewCell {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
    }
    
    func setButtonNumber(item: Int) {
        let button = ActionButton(frame: self.contentView.frame)
        button.setItemNumber(item)
        self.contentView.addSubview(button)
    }
}
