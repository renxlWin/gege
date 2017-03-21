//
//  UIImage+Extension.swift
//  swiftChuge
//
//  Created by RXL on 17/3/21.
//  Copyright © 2017年 RXL. All rights reserved.
//

import UIKit

extension UIImage {
    
    static func imageWithColor(color : UIColor?) -> UIImage {
        
        //描述一个矩形
        let rect = CGRect(x:0.0,y:0.0,width:1.0,height:1.0);
        
        //开启图形上下文
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0);
        
        //获得图形上下文
        let ctx = UIGraphicsGetCurrentContext();
        
        //使用color演示填充上下文
        ctx!.setFillColor((color?.cgColor)!);
        
        //渲染上下文
        ctx!.fill(rect);
        
        let image = UIGraphicsGetImageFromCurrentImageContext();
        
        //关闭图形上下文
        UIGraphicsEndImageContext();
        
        return image!;
        
    }
    
}
