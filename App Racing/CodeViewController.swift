//
//  CodeViewController.swift
//  App Racing
//
//  Created by Hat Dao on 9/26/15.
//  Copyright © 2015 Bang Dao. All rights reserved.
//

import UIKit

class CodeViewController: UIViewController, UITableViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var codeLines = NSMutableArray()
    
    static var instance:CodeViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        CodeViewController.instance = self
        self.collectionView.registerClass(ActionCollectionViewCell.self, forCellWithReuseIdentifier: "actionCell")
        self.tableView.registerClass(CodeTableViewCell.self, forCellReuseIdentifier: "codeCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("actionCell", forIndexPath: indexPath) as! ActionCollectionViewCell
        cell.setButtonNumber(indexPath.item)

        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func buttonClicked(sender: AnyObject?) {
        let button = sender as! ActionButton
        if (button.getCommand() == "remove") {
            self.codeLines.removeAllObjects()
        } else {
            self.codeLines.addObject(button.getCommand())
        }
        self.tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.codeLines.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("codeCell", forIndexPath: indexPath)
        cell.textLabel!.text = self.codeLines.objectAtIndex(indexPath.row) as? String
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "executeCode") {
            let runController = segue.destinationViewController as! RunViewController
            runController.setSolutions(self.codeLines)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
