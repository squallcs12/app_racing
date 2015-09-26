//
//  ViewController.swift
//  App Racing
//
//  Created by Hat Dao on 9/26/15.
//  Copyright © 2015 Bang Dao. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var mapView: MapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib3
        self.mapView.initMap(AppData().getLevel())

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func redrawMap() {
        self.mapView.initMap(AppData().getLevel())
    }
    @IBAction func startOver(sender: AnyObject) {
        AppData().saveLevel(1)
        self.redrawMap()
    }
}

