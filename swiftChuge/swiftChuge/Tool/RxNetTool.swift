//
//  RxNetTool.swift
//  swiftChuge
//
//  Created by RXL on 17/3/23.
//  Copyright © 2017年 RXL. All rights reserved.
//

import UIKit
import AFNetworking


/*！定义请求类型的枚举 */
enum RxNetToolRequestEnum : Int {
    
    case RXHttpRequestTypeGet = 0
    
    case RXHttpRequestTypePost
    
    case RXHttpRequestTypePut
    
    case RXHttpRequestTypeDelete
    
}

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
        return NSError(domain: "test.chuge.com", code: self.rawValue, userInfo: ["errorDescription" : self.errorDescription])
    }
}

class RxNetTool: AFHTTPSessionManager {
    
    static let sharedInstance: RxNetTool = {
        
        let tool = RxNetTool()
        
        tool.requestSerializer = AFJSONRequestSerializer(writingOptions: JSONSerialization.WritingOptions(rawValue: 0));
        
        tool.requestSerializer.willChangeValue(forKey: "timeoutInterval");
        
        tool.requestSerializer.timeoutInterval = 15.0;
        
        tool.requestSerializer.didChangeValue(forKey: "timeoutInterval");
        
        tool.requestSerializer.setValue("application/json", forHTTPHeaderField: "Content-Type");
        
        let token = UserDefaults.standard.string(forKey: "token");
        
        if let vaildToken = token{
            
            tool.requestSerializer.setValue(vaildToken, forHTTPHeaderField: "token");
            
        }
        
        let resonponse = AFJSONResponseSerializer(readingOptions: JSONSerialization.ReadingOptions(rawValue: 0));
        
        resonponse.removesKeysWithNullValues = true;

        tool.responseSerializer.acceptableContentTypes?.insert("application/json");
        
        return tool
    }()
    
    var taskArr : Array<Any>?;
}

extension RxNetTool {
    
    func rx_request(requestType : RxNetToolRequestEnum , urlString : String , parameters : Any? , success :  RXResponseSuccess? ,fail :  RXResponseFail? , progress : RXDownloadProgress?){
        
        if urlString.isEmpty {return };
        
        let urlStr = urlString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlPathAllowed)!;
        
        if requestType == .RXHttpRequestTypePost{
            
            RxNetManager.post(urlStr, parameters: parameters, progress: { (progress) in
                
            }, success: { (task, responseObject) in
                
                if let successBlock = success {
                    
                    successBlock(responseObject as AnyObject);
                }
                
            }, failure: { (task, error) in
                
                if let failBlock = fail {
                    
                    failBlock(error);
                }
                
            })
            
        }else if (requestType == .RXHttpRequestTypeGet){
            
            RxNetManager.get(urlStr, parameters: parameters, progress: { (progress) in
                
            }, success: { (task, responseObject) in
                
                if let successBlock = success {
                    
                    successBlock(responseObject as AnyObject);
                }
                
            }, failure: { (task, error) in
                
                if let failBlock = fail {
                    
                    failBlock(error);
                }
            })
            
        }else if (requestType == .RXHttpRequestTypePut){
            
            RxNetManager.put(urlStr, parameters: parameters, success: { (task, responseObject) in
                
                if let successBlock = success {
                    
                    successBlock(responseObject as AnyObject);
                }
                
            }, failure: { (task, error) in
                
                if let failBlock = fail {
                    
                    failBlock(error);
                }
                
            })
            
        }else if (requestType == .RXHttpRequestTypeDelete){
            
            RxNetManager.delete(urlStr, parameters: parameters, success: { (task, responseObject) in
                
                if let successBlock = success {
                    
                    successBlock(responseObject as AnyObject);
                }
                
            }, failure: { (task, error) in
                
                if let failBlock = fail {
                    
                    failBlock(error);
                }
                
            })
            
        }
    }
}

