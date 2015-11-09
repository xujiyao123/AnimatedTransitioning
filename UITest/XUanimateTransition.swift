//
//  XUanimateTransition.swift
//  UITest
//
//  Created by 徐继垚 on 15/11/6.
//  Copyright © 2015年 徐继垚. All rights reserved.
//

import UIKit

class XUanimateTransition: NSObject ,UIViewControllerAnimatedTransitioning{

    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        
        
        
        return 0.6
        
        
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        let  from = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        
        print(from)
        
        if (from!.isKindOfClass(ViewController.self) ) {
            
            let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)  as! ViewController
            
            
            let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)as! PushViewController
            
            let  containerView = transitionContext.containerView()

            
            let cell = fromVC.tableView.cellForRowAtIndexPath(fromVC.indexPath) as! TableViewCell
            
            print(fromVC.indexPath.row)
            
            let snapShotView = cell.mainImageView.snapshotViewAfterScreenUpdates(false)
            
//            snapShotView.frame = (containerView?.convertRect(cell.mainImageView.frame, fromView: cell.mainImageView.superview))!
           
            snapShotView.frame = fromVC.cellframe
            print(snapShotView.frame)
            
            cell.mainImageView.hidden = true
            
            
            
            toVC.view.frame = transitionContext.finalFrameForViewController(toVC)
        
            toVC.view.alpha = 0
            toVC.imageView.hidden = true
            
            containerView?.addSubview(toVC.view)
            containerView?.addSubview(snapShotView)
            
            
          UIView.animateWithDuration(transitionDuration(transitionContext), delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            
            toVC.view.alpha = 1;
            snapShotView.frame = (containerView?.convertRect(toVC.imageView.frame, fromView: toVC.view))!
            
            
            
            
            }, completion: { (finished:Bool) -> Void in
                
                toVC.imageView.hidden = false
                cell.mainImageView.hidden = false
                snapShotView.removeFromSuperview()
                
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
                
          })
            
            
            
            
        }else if (from!.isKindOfClass(PushViewController.self) ) {
            
            
            let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)  as! ViewController;
            
            
            let fromeVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)as! PushViewController
            
            let  containerView = transitionContext.containerView()
            
            
            let snapShotView = fromeVC.imageView.snapshotViewAfterScreenUpdates(false)
            
            //            snapShotView.frame = (containerView?.convertRect(cell.mainImageView.frame, fromView: cell.mainImageView.superview))!
            
            snapShotView.frame = fromeVC.imageView.frame
            print(snapShotView.frame)
            
           fromeVC.imageView.hidden = true
            
            
            
            toVC.view.frame = transitionContext.finalFrameForViewController(toVC)
            
            toVC.view.alpha = 0
            
            let cell = toVC.tableView.cellForRowAtIndexPath(toVC.indexPath) as! TableViewCell
            cell.mainImageView.hidden = true
            
            
            containerView?.addSubview(toVC.view)
            containerView?.addSubview(snapShotView)
            
            
            UIView.animateWithDuration(transitionDuration(transitionContext), delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                
                toVC.view.alpha = 1;
                
                let rectintable = toVC.tableView.rectForRowAtIndexPath(toVC.indexPath)
                
                let rect = toVC.tableView.convertRect(rectintable, toView: toVC.tableView.superview)

                
                snapShotView.frame = rect
                
                
                
                
                }, completion: { (finished:Bool) -> Void in
                    
                    fromeVC.imageView.hidden = false
                    cell.mainImageView.hidden = false
                    snapShotView.removeFromSuperview()
                    
                    transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
                    
            })

            
            
            
            
        }
        
        
        
        
        
    }
    
    
    
    
}
