//
//  RxTabBar.swift
//  swiftChuge
//
//  Created by RXL on 17/3/22.
//  Copyright © 2017年 RXL. All rights reserved.
//

import UIKit

protocol RxTabBarDelegate : NSObjectProtocol {
    
    func tabBarPlusBtnClick();
    
}

class RxTabBar: UITabBar {
    
    weak var tabBarDelegate: RxTabBarDelegate?;
    
    override init(frame : CGRect){
        
        super.init(frame: frame);
        
        self.backgroundColor = UIColor.white;
        
        self.shadowImage = UIImage.imageWithColor(color: UIColor.clear);
        
        addSubview(plusBtn);
        
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews();
        
        let btnClass : AnyClass = NSClassFromString("UITabBarButton")!;
        
        plusBtn.bounds = CGRect(origin: CGPoint() , size : (plusBtn.currentImage?.size)!);
        
        let y = self.bounds.size.height - (plusBtn.currentImage?.size.height)! * 0.5;
        
        plusBtn.center = CGPoint(x: self.center.x, y: y);
        
        var btnIndex : CGFloat = 0;
        
        let btnWidth = self.bounds.width *  0.2;
        
        for btn in self.subviews {
            
            if btn.isKind(of: btnClass) {
                
                btn.frame = CGRect(x: btnWidth * btnIndex, y: btn.frame.origin.y, width: btnWidth, height: btn.frame.size.height);
                
                btnIndex += 1;
                
                if btnIndex == 2 {
                    
                    btnIndex += 1;
                    
                }
            }
            
        }
        
        bringSubview(toFront: plusBtn);
    }
    
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        
        if !isHidden {
            
            let newPoint = convert(point, to: plusBtn);
            
            if plusBtn.point(inside: newPoint, with: event) {
                
                return plusBtn;
            }else{
                
                return super.hitTest(point, with: event);
            }
        }else{
            
            return super.hitTest(point, with: event);
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func plusBtnClick(){
        
        if (tabBarDelegate?.responds(to: Selector(("tabBarPlusBtnClick"))))! {
            
            tabBarDelegate?.tabBarPlusBtnClick();
            
        }
        
    }
    
    lazy var plusBtn : UIButton = {
       
        let button = UIButton();
        
        button.setImage(UIImage(named : "plusAdd"), for: .normal);
        
        button.setImage(UIImage(named : "plusAdd"), for: .highlighted);
        
        button.addTarget(self, action: #selector(RxTabBar.plusBtnClick), for: .touchUpInside);
        
        return button;
    }()

}
