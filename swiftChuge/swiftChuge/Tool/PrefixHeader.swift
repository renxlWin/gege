//
//  PrefixHeader.swift
//  swiftChuge
//
//  Created by RXL on 17/3/21.
//  Copyright © 2017年 RXL. All rights reserved.
//

import UIKit
import SnapKit


//MARK : 请求地址
//用户账户
let SERVER_URL_USER = "https://test.imchuge.com/userAccount/"
//用户登录注册
let SERVER_URL_Register = "https://test.imchuge.com/register/"

//用户动态
let SERVER_URL_Dynamic = "https://test.imchuge.com/dynamic/"

//用户约会
let SERVER_URL_Date  = "http://test.imchuge.com/date/"

//用户举报
let SERVER_URL_Report = "https://test.imchuge.com/report/"

//支付
let SERVER_URL_Alipay = "https://test.imchuge.com/payment/"

//声音
let SERVER_URL_Media = "http://test.imchuge.com/media/"

//MARK:颜色相关
/** 背景颜色 */
let Background_color = set_color(red:250,green:250,blue:250,alpha:1)

let mainThemeColor = set_color(red:214,green:86,blue:56,alpha:1)

let lineColor = set_color(red:235,green:235,blue:235,alpha:1)

func set_color(red:CGFloat,green:CGFloat,blue:CGFloat,alpha: CGFloat) -> UIColor{
    
    return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha);
}

//MARK:单例
let RxNetManager = RxNetTool.sharedInstance;
let RxLocationManager = RxLocationTool.sharedInstance;


//MARK : 位置
let currentLatitude = RxLocationManager.latitude;
let currentLongitude = RxLocationManager.longitude;



//MARK:高度相关

let screenHeight = UIScreen.main.bounds.height;
let screenWidth = UIScreen.main.bounds.width;



