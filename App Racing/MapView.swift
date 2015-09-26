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
    var centerY:Double = 280.0;
    let car = CarView()
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        centerX = centerX - pointEdge/2
        centerY = centerY - pointEdge/2
        super.init(frame: frame)
        self.addSubview(car)
    }
    
    func drawPoint(x: Int, y: Int) -> UIView {
        let X = Double(x) * pointEdge + centerX
        let Y = Double(y) * pointEdge + centerY
        let point = UIView(frame: CGRectMake(CGFloat(X), CGFloat(Y), CGFloat(pointEdge), CGFloat(pointEdge)))
        point.backgroundColor = UIColor.blackColor()
        self.addSubview(point)
        return point
    }
    
    func drawCar(x: Int, y: Int) -> UIView {
        let X = Double(x) * pointEdge + centerX - 1.5 * pointEdge
        let Y = Double(y) * pointEdge + centerY - 1.5 * pointEdge
        let carSize = CGFloat(pointEdge * 4.0)
        car.frame = CGRectMake(CGFloat(X), CGFloat(Y), carSize, carSize)
        return car
    }
    
    func moveCar(x: Int, y: Int) {
        
        let X = Double(x) * pointEdge + centerX + 0.5 * pointEdge
        let Y = Double(y) * pointEdge + centerY + 0.5 * pointEdge
        let newCenter = CGPointMake(CGFloat(X), CGFloat(Y))
        
        UIView.animateWithDuration(3.0,
            delay: 0.5,
            options: UIViewAnimationOptions.CurveEaseInOut,
            animations: {
                self.car.center = newCenter
            },
            completion: {
                finished in
                return
        })
    }

}
