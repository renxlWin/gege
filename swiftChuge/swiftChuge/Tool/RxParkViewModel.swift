//
//  RxParkViewModel.swift
//  swiftChuge
//
//  Created by RXL on 17/3/27.
//  Copyright © 2017年 RXL. All rights reserved.
//

import UIKit

private let RxParkVMInstance = RxParkViewModel()

class RxParkViewModel: NSObject {

    class var sharedInstance : RxParkViewModel {
        
        let tool = RxParkVMInstance;
        
        return tool;
    }
    
    lazy var parkIdArr : NSMutableArray = {
        
        let arr = NSMutableArray()
        
        return arr;
    }()
}

extension RxParkViewModel {
    
    func loadParkData(parkPage : Int , success :  RXResponseSuccess? ,fail :  RXResponseFail? , progress : RXDownloadProgress?){
        
        let urlStr = SERVER_URL_Dynamic.appending("user/dynamic/mixdataList/v1");
        
        var dict = [String : AnyObject]();
        
        dict["latitude"] = String(format: "%.15f", currentLatitude) as AnyObject?;
        
        dict["longitude"] = String(format: "%.15f", currentLongitude) as AnyObject?;
        
        dict["pageIndex"] = parkPage as AnyObject?;
        
        var idArr : [String] = [String]();
        
        for dateId in parkIdArr {
            
            if (parkIdArr.index(of: dateId)/10 == parkPage - 1) {
                
                idArr.append(dateId as! String);
                
            }
        }
        
        dict["dataIds"] = idArr as AnyObject?;
        
        RxNetManager.rx_request(requestType: .RXHttpRequestTypePost, urlString: urlStr, parameters: dict, success: { (response) in
            
            if let successBlock = success{
                
                successBlock(response);
                
            }
            
        }, fail: { (error) in
            
            if let failBlock = fail{
                
                failBlock(error);
                
                print(error);
            }
            
        }, progress: nil);
        
    }
}
