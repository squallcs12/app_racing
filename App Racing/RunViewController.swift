//
//  ViewController.swift
//  App Racing
//
//  Created by Hat Dao on 9/26/15.
//  Copyright © 2015 Bang Dao. All rights reserved.
//

import UIKit

class RunViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var mapView: MapView!
    @IBOutlet weak var labelView: UILabel!
    
    var commands = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let level = AppData().getLevel()
        self.mapView.initMap(level)
        self.mapView.testSolutions(self.commands,
            completion: {
            number in
                var title:String = "title"
                var message:String = "message"
                
                switch (number) {
                case -2:
                    title = "Error"
                    message = "Not enough commands!"
                    break
                    
                case -1:
                    title = "Error"
                    message = "Not enough commands!"
                    break
                    
                case 1:
                    title = "Congratslation!"
                    message = "Your code works!"
                    print(level)
                    if level < 4 {
                        AppData().saveLevel(level + 1)
                    } else {
                        message = "You finished the game"
                    }
                    
                    break
                    
                case 0:
                    title = "Error"
                    message = "Wrong code!"
                    break
                    
                default:
                    break
                    
                }
                let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
                
                let okAction = UIAlertAction(title: "Ok", style: .Cancel) { (action:UIAlertAction!) in
                    if level < 4 {
                        let viewController = self.navigationController?.viewControllers[0] as! ViewController
                        viewController.redrawMap()
                        self.navigationController?.popToRootViewControllerAnimated(true)
                    }
                }
                alert.addAction(okAction)
                self.presentViewController(alert, animated: true, completion:nil)
            },
            onRunning: {
            index in
                let command = self.commands.objectAtIndex(index) as! String
                self.labelView.text = String(index+1) + ". " + command
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setSolutions(commands: NSMutableArray) {
        self.commands = commands
    }
    
}

