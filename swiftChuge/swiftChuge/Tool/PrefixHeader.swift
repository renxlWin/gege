//
//  PrefixHeader.swift
//  swiftChuge
//
//  Created by RXL on 17/3/21.
//  Copyright © 2017年 RXL. All rights reserved.
//

import UIKit

//用户账户
let SERVER_URL_USER = "http://test.imchuge.com/userAccount/"
//用户登录注册
let SERVER_URL_Register = "http://test.imchuge.com/register/"

//用户动态
let SERVER_URL_Dynamic = "http://test.imchuge.com/dynamic/"

//用户约会
let SERVER_URL_Date  = "http://test.imchuge.com/date/"

//用户举报
let SERVER_URL_Report = "http://test.imchuge.com/report/"

//支付
let SERVER_URL_Alipay = "http://test.imchuge.com/payment/"

//声音
let SERVER_URL_Media = "http://test.imchuge.com/media/"


/** 背景颜色 */
let Background_color = set_color(red:250,green:250,blue:250,alpha:1)

let mainThemeColor = set_color(red:214,green:86,blue:56,alpha:1)

func set_color(red:CGFloat,green:CGFloat,blue:CGFloat,alpha: CGFloat) -> UIColor{
    
    return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha);
}
