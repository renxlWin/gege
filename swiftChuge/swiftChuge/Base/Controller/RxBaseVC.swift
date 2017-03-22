//
//  RxBaseVC.swift
//  swiftChuge
//
//  Created by RXL on 17/3/21.
//  Copyright © 2017年 RXL. All rights reserved.
//

import UIKit


class RxBaseVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Background_color;
        setNav();
    }

    private func setNav(){
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage.imageWithColor(color: mainThemeColor), for: .any, barMetrics: .default);
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white];
        
    }
    
    
}
