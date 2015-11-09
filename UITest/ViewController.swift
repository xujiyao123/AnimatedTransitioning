//
//  ViewController.swift
//  UITest
//
//  Created by 徐继垚 on 15/10/31.
//  Copyright © 2015年 徐继垚. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate ,UITableViewDataSource ,UIViewControllerTransitioningDelegate{
   
    var tableView : UITableView!
    
    var indexPath: NSIndexPath!
    
    var cellframe : CGRect!
    
    var imgs : NSMutableArray!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()

//        
        imgs = NSMutableArray(objects: UIImage(named: "1.jpg")!,UIImage(named: "2.jpg")!,UIImage(named: "3.jpg")!,UIImage(named: "4.jpg")!,UIImage(named: "1.jpg")!,UIImage(named: "2.jpg")!,UIImage(named: "3.jpg")!,UIImage(named: "4.jpg")!)
        
        let navView = UIView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, 64))
        
        navView.backgroundColor = UIColor.redColor()
        
        self.view.addSubview(navView)
        
        
        tableView = UITableView(frame: CGRectMake(0, 64, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height - 64 ))
        self.tableView.delegate = self
        tableView.dataSource = self
        
        tableView.registerClass(TableViewCell.self, forCellReuseIdentifier: "cell")
        
        self.view.addSubview(tableView)
       
        
        
//        let  bubbview = bubbleView(frame:CGRectMake(100, 100, 100, 30))
//
//    
//        self.view.addSubview(bubbview)
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imgs.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! TableViewCell
        cell.alabel.text = "我是\(indexPath.row + 1)"
        cell.mainImageView.image = imgs[indexPath.row] as? UIImage
        cell.selectionStyle = UITableViewCellSelectionStyle.None
       
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 200
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let vc = PushViewController()
           self.indexPath = indexPath
        

       let rectintable = tableView.rectForRowAtIndexPath(indexPath)
        
        let rect = tableView.convertRect(rectintable, toView: tableView.superview)
        
        self.cellframe = rect
        
        vc.transitioningDelegate = self
        vc.image = imgs[indexPath.row] as! UIImage
        
        presentViewController(vc, animated: true, completion: nil)
        
        
        
    }
    
    
    
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        
        
        return XUanimateTransition()
        
        
    }
    
    
    
    
    
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

