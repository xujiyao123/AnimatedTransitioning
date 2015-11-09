//
//  TableViewCell.swift
//  UITest
//
//  Created by 徐继垚 on 15/10/31.
//  Copyright © 2015年 徐继垚. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    var mainImageView: UIImageView!
    var alabel : UILabel!
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        mainImageView = UIImageView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, 200))
        
//        mainImageView.image = UIImage(named: "1.jpg")
        
        mainImageView.contentMode = UIViewContentMode.ScaleAspectFill
        mainImageView.clipsToBounds = true
        
        self.addSubview(mainImageView)
        
        alabel = UILabel(frame: CGRectMake(0, 170, UIScreen.mainScreen().bounds.width, 30))
        
//        alabel.text = "122343"
        
        alabel.backgroundColor = UIColor(white: 1, alpha: 0.4)
        
        alabel.textColor = UIColor.whiteColor()
        
        
        
        self.addSubview(alabel)
        
        
        
        
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
