//
//  RxNetTool.swift
//  swiftChuge
//
//  Created by RXL on 17/3/23.
//  Copyright © 2017年 RXL. All rights reserved.
//

import UIKit
import AFNetworking

// Swift中得枚举不仅可以有成员,还可以有属性,还有可以有方法
enum RxNetToolErrorEnum: Int {
    case AccessTokenEmpty = -1
    
    var errorDescription: String {
        get {
            switch self {
            case .AccessTokenEmpty: return "access_token没有值"
            }
        }
    }
    
    // 返回一个错误
    func error() -> NSError {
        return NSError(domain: "cn.itheima.net", code: self.rawValue, userInfo: ["errorDescription" : self.errorDescription])
    }
}

class RxNetTool: AFHTTPSessionManager {

    static let sharedInstance: RxNetTool = {
        
        let tool = RxNetTool()
        
        //MARK : 设置请求参数格式
        tool.requestSerializer.willChangeValue(forKey: "timeoutInterval");
        
        tool.requestSerializer.timeoutInterval = 15.0;
        
        tool.requestSerializer.didChangeValue(forKey: "timeoutInterval");
        
        tool.requestSerializer = AFJSONRequestSerializer(writingOptions: JSONSerialization.WritingOptions(rawValue: 0));
        
        tool.requestSerializer.setValue("application/json", forHTTPHeaderField: "Content-Type");
        
        let token = UserDefaults.standard.string(forKey: "token");
        
        if !(token?.isEmpty)! {
            
            tool.requestSerializer.setValue(token, forHTTPHeaderField: "token");
        }
        
        let resonponse = AFJSONResponseSerializer(readingOptions: JSONSerialization.ReadingOptions(rawValue: 0));
        
        resonponse.removesKeysWithNullValues = true;

        tool.responseSerializer.acceptableContentTypes?.insert("application/json");
        
        return tool
    }()
}

