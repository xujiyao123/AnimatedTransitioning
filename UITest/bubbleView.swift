//
//  bubbleView.swift
//  UITest
//
//  Created by 徐继垚 on 15/11/2.
//  Copyright © 2015年 徐继垚. All rights reserved.
//

import UIKit

class bubbleView: UIView {
    
    var title : NSString!
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        title = "1231231"
        
        
        
         self.backgroundColor = UIColor.clearColor()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
      
        
     
        
        
        let contentText = UIGraphicsGetCurrentContext()
        //100 100 100 30
        
//        CGContextAddRect(contentText, CGRectMake(120, 280, 100, 304))

        
        CGContextBeginPath(contentText)
        
        CGContextMoveToPoint(contentText, rect.origin.x + rect.size.width, rect.origin.y + rect.size.height/5*4 - 10)
        
        CGContextAddArcToPoint(contentText, rect.origin.x + rect.size.width, rect.origin.y + rect.size.height/5*4, rect.origin.x + rect.size.width - 10, rect.origin.y + rect.size.height/5*4, 5);
        CGContextAddArcToPoint(contentText, rect.origin.x , rect.origin.y + rect.size.height/5*4, rect.origin.x, rect.origin.y + rect.size.height/5*4 - 10, 5);
        CGContextAddArcToPoint(contentText, rect.origin.x, rect.origin.y, rect.origin.x + rect.size.width - 10, rect.origin.y, 5);
        CGContextAddArcToPoint(contentText, rect.origin.x + rect.size.width,  rect.origin.y, rect.origin.x + rect.size.width, rect.origin.y + rect.size.height/5*4 - 10, 5)
       
        CGContextClosePath(contentText)
        
        


        CGContextSetFillColorWithColor(contentText, UIColor.lightGrayColor().CGColor)

        CGContextFillPath(contentText)
        
        
        CGContextSetTextDrawingMode(contentText, .FillStroke)
        CGContextSetLineWidth(contentText,0)
        
        title.drawInRect(CGRectMake(rect.origin.x + 5, rect.origin.y + 5 , rect.size.width, rect.size.height/5*4), withAttributes: nil)
        
        
        let context2 = UIGraphicsGetCurrentContext()
        
        CGContextBeginPath(context2)
        
        CGContextMoveToPoint(context2, rect.size.width/2, rect.size.height)
        
        CGContextAddLineToPoint(context2, rect.size.width/6*2.5, rect.size.height/5*4)
        
        CGContextAddLineToPoint(context2, rect.size.width/6*2.5 + 15, rect.size.height/5*4)
        
        CGContextSetFillColorWithColor(context2, UIColor.lightGrayColor().CGColor)
        
        CGContextClosePath(context2)
        
        CGContextFillPath(context2)
        
        
        
        
        
        
        
        
    }


}
