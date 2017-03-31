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
        
        SVProgressHUD.setMinimumDismissTimeInterval(1.0);
        
        weak var weakSelf = self
        
        checkLocationStatus = { () -> Bool in
          
            if !RxLocationManager.locationStatu() {
                
                weakSelf?.popSet();
                
            }
            
            return RxLocationManager.locationStatu();
        }
    }
    
    var checkLocationStatus : (() -> Bool)?;
    
    private func setNav(){
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage.imageWithColor(color: mainThemeColor), for: .any, barMetrics: .default);
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white];
        
    }
    
    private func popSet() {
        
        let alertVC = UIAlertController(title: "温馨提示", message: "请打开定位权限", preferredStyle: .alert);
        
        let setAction = UIAlertAction(title: "设置", style: .default) { (action) in
            
            let url = NSURL(string: UIApplicationOpenSettingsURLString);
            
            if (UIApplication.shared.canOpenURL(url as! URL)){
                
                UIApplication.shared.openURL(url as! URL);
            }
            
        };
        
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil);
        
        alertVC.addAction(cancelAction);
        
        alertVC.addAction(setAction);
        
        getCurrentWinVC().present(alertVC, animated: true, completion: nil);
    }
    
    
    private func getCurrentWinVC() -> UIViewController{
        
        let result :UIViewController?;
        
        var window = UIApplication.shared.keyWindow;
        
        if (window?.windowLevel != UIWindowLevelNormal){
            
            let windowArr = UIApplication.shared.windows;
            
            for tempWin in windowArr {
                
                if tempWin.windowLevel == UIWindowLevelNormal {
                    
                    window = tempWin;
                    
                    break;
                }
            }
        }
        
        let frontView = window?.subviews[0];
        
        let nextResponse = frontView?.next;
        
        if (nextResponse?.isKind(of: NSClassFromString("UIViewController")!))!{
            
            result = nextResponse as! UIViewController?;
            
        }else{
            
            result = window?.rootViewController;
        }
        
        return result!;
    }
}
