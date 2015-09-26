//
//  ViewController.swift
//  App Racing
//
//  Created by Hat Dao on 9/26/15.
//  Copyright © 2015 Bang Dao. All rights reserved.
//

import UIKit

class RunViewController: UIViewController, UIScrollViewDelegate {
    
    var mapView:MapView = MapView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.mapView.frame = self.view.frame
        self.view.addSubview(mapView)
        
        self.drawMap([
            [0, -18],
            [0, -17],
            [0, -16],
            [0, -15],
            [0, -14],
            [0, -13],
            [0, -12],
            [0, -11],
            [0, -10],
            [0, -9],
            [0, -8],
            [0, -7],
            [0, -6],
            [0, -5],
            [0, -4],
            [0, -3],
            [0, -2],
            [0, -1],
            [0, 0],
            [0, 1],
            [0, 2],
            [0, 3],
            [0, 4],
            [0, 5],
            [0, 6],
            [0, 7],
            [0, 8],
            [0, 9],
            [0, 10],
            [0, 11],
            [0, 12],
            [0, 13],
            [0, 14],
            [0, 15],
            [0, 16],
            [0, 17],
            [0, 18],
            ])
        self.mapView.drawCar(0, y: 18)
        self.mapView.moveCar(0, y: -18)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func drawMap(points: NSArray) {
        for var point in points {
            point = point as! NSArray
            let x = point.objectAtIndex(0) as! Int
            let y = point.objectAtIndex(1) as! Int
            self.mapView.drawPoint(x, y: y)
        }
    }
}

