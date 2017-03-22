//
//  RxNetRequstManager.swift
//  swiftChuge
//
//  Created by Rxl on 2017/3/22.
//  Copyright © 2017年 RXL. All rights reserved.
//

import UIKit
import Alamofire

private let RxNetManagerInstance = RxNetRequstManager()

class RxNetRequstManager: NSObject {
    
    class var sharedInstance : RxNetRequstManager {
        return RxNetManagerInstance;
    }
    
    
}
extension RxNetRequstManager {
    
    func getRequest(urlString: String, params : [String : Any], success : @escaping (_ response : [String : AnyObject])->(), failture : @escaping (_ error : Error)->()) {
        
        
        Alamofire.request(urlString, method: .get, parameters: params)
            .responseJSON { (response) in/*这里使用了闭包*/
                
                switch response.result {
                case .success(let value):
                    
                    success(value as! [String : AnyObject])
                    
                case .failure(let error):
                    failture(error)
                    print("error:\(error)")
                }
        }
        
    }
    //MARK: - POST 请求
    func postRequest(urlString : String, params : [String : Any], success : @escaping (_ response : [String : AnyObject])->(), failture : @escaping (_ error : Error)->()) {
        
        Alamofire.request(urlString, method: HTTPMethod.post, parameters: params).responseJSON { (response) in
            switch response.result{
                
            case .success:
                
                if let value = response.result.value as? [String: AnyObject] {
                    
                    success(value)
                    
                }
                
            case .failure(let error):
                
                failture(error)
                
                print("error:\(error)")
            }
            
        }
    }
    
    //MARK: - 照片上传
    ///
    /// - Parameters:
    ///   - urlString: 服务器地址
    ///   - params: ["flag":"","userId":""] - flag,userId 为必传参数
    ///        flag - 666 信息上传多张  －999 服务单上传  －000 头像上传
    ///   - data: image转换成Data
    ///   - name: fileName
    ///   - success:
    ///   - failture:
    func upLoadImageRequest(urlString : String, params:[String:String], data: [Data], name: [String],success : @escaping (_ response : [String : AnyObject])->(), failture : @escaping (_ error : Error)->()){
        
        let headers = ["content-type":"multipart/form-data"]
        
        Alamofire.upload(
            multipartFormData: { multipartFormData in
                //666多张图片上传
                let flag = params["flag"]
                let userId = params["userId"]
                
                multipartFormData.append((flag?.data(using: String.Encoding.utf8)!)!, withName: "flag")
                multipartFormData.append( (userId?.data(using: String.Encoding.utf8)!)!, withName: "userId")
                
                for i in 0..<data.count {
                    multipartFormData.append(data[i], withName: "appPhoto", fileName: name[i], mimeType: "image/png")
                }
        },
            to: urlString,
            headers: headers,
            encodingCompletion: { encodingResult in
                switch encodingResult {
                case .success(let upload, _, _):
                    upload.responseJSON { response in
                        if let value = response.result.value as? [String: AnyObject]{
                            success(value)
                            
                        }
                    }
                case .failure(let encodingError):
                    
                    print(encodingError);
                    
                }
        }
        )
}
}
