//
//  RxHomeVC.swift
//  swiftChuge
//
//  Created by RXL on 17/3/21.
//  Copyright © 2017年 RXL. All rights reserved.
//

import UIKit

class RxNearVC: RxBaseVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK:界面布局
    private func prepareUI(){
        
        
    }
    
    //MARK:懒加载
    lazy var contentScroll : UIScrollView = {
        
        let scrollView = UIScrollView(frame:self.view.bounds);
        
        scrollView.backgroundColor = UIColor.white;
        
        scrollView.delegate = self;
        
        return scrollView;
    }()
}

//MARK:代理
extension RxNearVC : UIScrollViewDelegate{
    
}
