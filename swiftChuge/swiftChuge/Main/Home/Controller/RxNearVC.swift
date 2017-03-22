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
        
        prepareUI();
        
    }
    
    //MARK:界面布局
    private func prepareUI() {
        
        setNav();
        
        view.addSubview(contentScroll);
        
        contentScroll.snp.makeConstraints { (make) in
            
            make.edges.equalToSuperview().inset(UIEdgeInsetsMake(0, 0, 44, 0));
            
        }
        
        contentScroll.addSubview(headVC.view);
        
        headVC.view.snp.makeConstraints { (make) in
          
            make.leading.top.equalToSuperview();
            make.width.equalTo(screenWidth);
        };
    }
    
    private func setNav(){
        
        self.navigationItem.titleView = titleSegment;
        
    }
    
    //MARK:点击事件
    func changeView(){
        
        let index : CGFloat = CGFloat(titleSegment.selectedSegmentIndex);
        
        contentScroll.setContentOffset(CGPoint(x: screenWidth * index , y : 0), animated: true);
        
    }
    
    //MARK:懒加载
    lazy var headVC : RxNearHeadVC = {
       
        let headVC = RxNearHeadVC()
        
        return headVC;
    }()
    
    
    lazy var contentScroll : UIScrollView = {
        
        let scrollView = UIScrollView();
        
        scrollView.backgroundColor = UIColor.white;
        
        scrollView.contentSize = CGSize(width: screenWidth * 3, height: 0)
        
        scrollView.delegate = self;
        
        scrollView.isPagingEnabled = true;
        
        scrollView.bounces = false;
        
        scrollView.showsHorizontalScrollIndicator = false;
        
        return scrollView;
        
    }();
    
    lazy var titleSegment : UISegmentedControl = {
        
        let segment = UISegmentedControl(items: ["广场","人","颜值"])
        
        segment.frame = CGRect(x: 0, y: 0, width: screenWidth * 0.5, height: 30);
        
        segment.tintColor = UIColor.white;
        
        segment.selectedSegmentIndex = 1;
        
        let font = UIFont.systemFont(ofSize: 16);
        
        segment.setTitleTextAttributes([NSFontAttributeName : font], for: .normal);
        
        segment.addTarget(self, action:#selector(RxNearVC.changeView), for: .valueChanged);
        
        return segment;
    }();
    
}

//MARK:代理
extension RxNearVC : UIScrollViewDelegate{
    
}
