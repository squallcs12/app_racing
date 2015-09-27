//
//  Data.swift
//  App Racing
//
//  Created by Hat Dao on 9/27/15.
//  Copyright © 2015 Bang Dao. All rights reserved.
//

import Foundation


class AppData {
    
    func read(key: String) -> Int? {
        let defaults = NSUserDefaults.standardUserDefaults()
        return defaults.integerForKey(key)
    }
    
    func getLevel() -> Int {
        return 5
        var level = AppData().read("level")
        if level == nil || level == 0 {
            level = 1
        }
        return level!
    }
    
    func saveLevel(level: Int) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(level, forKey: "level")
        defaults.synchronize()
    }
}