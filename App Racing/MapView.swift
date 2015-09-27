//
//  MapView.swift
//  App Racing
//
//  Created by Hat Dao on 9/26/15.
//  Copyright © 2015 Bang Dao. All rights reserved.
//

import UIKit

class MapView: UIView {

    var pointEdge = 8.0
    var centerX:Double = 160.0;
    var centerY:Double = 220.0;
    let car = CarView()
    
    var map: Map? = nil
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    
    required init?(coder aDecoder: NSCoder) {
        centerX = centerX - pointEdge/2
        centerY = centerY - pointEdge/2
        super.init(coder: aDecoder)
        self.afterInit()
    }
    
    override init(frame: CGRect) {
        centerX = centerX - pointEdge/2
        centerY = centerY - pointEdge/2
        super.init(frame: frame)
        self.afterInit()
    }
    
    func afterInit() {
        self.addSubview(car)
        self.backgroundColor = UIColor(patternImage: UIImage(named: "img/map-background.png")!)
    }
    
    func drawPoint(x: Int, y: Int) -> UIView {
        let X = Double(x) * pointEdge + centerX
        let Y = Double(y) * pointEdge + centerY
        let point = UIView(frame: CGRectMake(CGFloat(X), CGFloat(Y), CGFloat(pointEdge), CGFloat(pointEdge)))
        point.backgroundColor = UIColor.blackColor()
        self.addSubview(point)
        return point
    }
    
    
    func drawMap(points: Array<Array<Int>>) {
        for var point in points {
            self.drawPoint(point[0], y: point[1])
        }
    }
    
    func drawCar(x: Int, y: Int) -> UIView {
        let X = Double(x) * pointEdge + centerX - 1.5 * pointEdge
        let Y = Double(y) * pointEdge + centerY - 1.5 * pointEdge
        let carSize = CGFloat(pointEdge * 4.0)
        car.frame = CGRectMake(CGFloat(X), CGFloat(Y), carSize, carSize)
        return car
    }
    
    func moveCar(x: Int, y: Int, completion: ((Bool) -> Void)?) {
        
        let X = Double(x) * pointEdge + centerX + 0.5 * pointEdge
        let Y = Double(y) * pointEdge + centerY + 0.5 * pointEdge
        let newCenter = CGPointMake(CGFloat(X), CGFloat(Y))
        
        UIView.animateWithDuration(3.0,
            delay: 0.5,
            options: UIViewAnimationOptions.CurveEaseInOut,
            animations: {
                self.car.center = newCenter
            },
            completion: completion
        )
    }
    
    func initMap(level: Int) {
//        for (index, view) in self.subviews.enumerate() {
//            if index > 0 {
//                view.removeFromSuperview()
//            }
//        }
        
        let map = Map.getMap(level)
        self.drawMap(map.map)
//        self.backgroundColor = UIColor(patternImage: UIImage(named: map.mapImagePath)!)
        self.drawCar(map.start_x, y: map.start_y)
        self.map = map
    }
    
    func doStep(commands: NSMutableArray, index: Int, completion: ((Int) -> Void), onRunning: ((Int) -> (Void))) {
        if map?.solutions.count <= index {
            completion(-1)
            return
        }
        if commands.count <= index {
            completion(-2)
            return
        }
        onRunning(index)
        let solution = map?.solutions[index]
        let command = commands.objectAtIndex(index) as! String
        if command == solution?.command {
            let destination = solution?.destination
            let x = (destination?[0])!
            let y = (destination?[1])!
            self.moveCar(x, y: y) {
                finished in
                if (x == self.map?.end_x && y == self.map?.end_y) {
                    completion(1)
                    return
                }
                self.doStep(commands, index: index + 1, completion: completion, onRunning: onRunning)
            }
        } else {
            completion(0)
        }
    }
    
    func testSolutions(commands: NSMutableArray, completion: ((Int) -> Void), onRunning: ((Int) -> (Void))) {
        doStep(commands, index: 0, completion: completion, onRunning: onRunning)
    }

}
