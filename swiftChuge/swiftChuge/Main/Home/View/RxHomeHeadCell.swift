//
//  RxHomeHeadCell.swift
//  swiftChuge
//
//  Created by RXL on 17/3/22.
//  Copyright © 2017年 RXL. All rights reserved.
//

import UIKit

class RxHomeHeadCell: UITableViewCell {
    
    class func cellWithTableView(tableView : UITableView) -> RxHomeHeadCell{
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "homeHead")
        
        if (cell == nil) {
            
            cell = RxHomeHeadCell(style: .default, reuseIdentifier: "homeHead");
        }
        
        return cell as! RxHomeHeadCell;
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
