//
//  PushViewController.swift
//  UITest
//
//  Created by 徐继垚 on 15/11/6.
//  Copyright © 2015年 徐继垚. All rights reserved.
//

import UIKit

class PushViewController: UIViewController ,UIViewControllerTransitioningDelegate{

    var imageView : UIImageView!
    
    var image: UIImage!
    
    var web : UIWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.view.backgroundColor = UIColor.whiteColor()
        
  

        imageView = UIImageView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, 200))
        
        imageView.image = self.image
        imageView.contentMode = UIViewContentMode.ScaleAspectFill
        imageView.clipsToBounds = true
        imageView.userInteractionEnabled = true
        self.view.addSubview(imageView)
        
        let  tap = UITapGestureRecognizer(target: self, action: Selector("back"))
        imageView.addGestureRecognizer(tap)
        
        
        web = UIWebView(frame: CGRectMake(0, 200, UIScreen.mainScreen().bounds.width, 500))
        web.loadRequest(NSURLRequest(URL: NSURL(string: "http://www.liwushuo.com/posts/1019980/content")!))
        
        self.view.addSubview(web)
        
        
        // Do any additional setup after loading the view.
    }
    func back() {
        
        
        self.transitioningDelegate = self
        
        
        self.dismissViewControllerAnimated(true, completion: nil)
        

        
        
    }
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return XUanimateTransition()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
