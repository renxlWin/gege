//
//  RxParkVC.swift
//  swiftChuge
//
//  Created by RXL on 17/3/22.
//  Copyright © 2017年 RXL. All rights reserved.
//

import UIKit

class RxParkVC: RxBaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        prepareUI();
    }



    // MARK: - lazyLoding
    lazy var headVC : RxNearHeadVC = {
        
        let headVC = RxNearHeadVC()
        
        return headVC;
    }()

}

//MARK:界面布局
extension RxParkVC {
    
    //MARK:界面布局
    func prepareUI() {
        
        view.addSubview(headVC.view);
        
        headVC.view.snp.makeConstraints { (make) in
            
            make.leading.trailing.top.equalTo(view);
        }
        
    }
    
}
