//
//  RxParkDynamicCell.swift
//  swiftChuge
//
//  Created by RXL on 17/3/29.
//  Copyright © 2017年 RXL. All rights reserved.
//

import UIKit

class RxParkDynamicCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func cellWithTableView(tableView : UITableView) -> RxParkDynamicCell{
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "parkDynamic")
        
        if (cell == nil) {
            
            cell = RxParkDynamicCell(style: .default, reuseIdentifier: "parkDynamic");
        }
        
        return cell as! RxParkDynamicCell;
    }
    
    
}
