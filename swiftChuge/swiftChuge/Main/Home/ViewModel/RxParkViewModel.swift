//
//  RxParkViewModel.swift
//  swiftChuge
//
//  Created by RXL on 17/3/27.
//  Copyright © 2017年 RXL. All rights reserved.
//

import UIKit
import RealmSwift

private let RxParkVMInstance = RxParkViewModel()

class RxParkViewModel: NSObject {

    let realm = try! Realm()
    
    class var sharedInstance : RxParkViewModel {
        
        let tool = RxParkVMInstance;
        
        return tool;
    }
    
    lazy var parkIdArr : [Any] = {
        
        let arr = [Any]();
        
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
        
        var i = 0;
        
        for dateId in parkIdArr {
            
            if (i/10 == parkPage - 1) {
                
                idArr.append(dateId as! String);
                
            }
            
            i += 1;
        }
        
        dict["dataIds"] = idArr as AnyObject?;
        
        weak var weakSelf = self;
        
        RxNetManager.rx_request(requestType: .RXHttpRequestTypePost, urlString: urlStr, parameters: dict, success: { (response) in
            
            if let successBlock = success{
                
                if (parkPage == 1) {
                    
                    if let dataDict = response as? [String : Any] , let idArr = dataDict["mixdataIds"] as? [Any] {
                        
                        weakSelf?.parkIdArr = idArr;
                        
                    }
                }
                
                var parkArr : [Any] = [Any]() ;
                
                if let dataDict = response as? [String : Any] , let jsonArr = dataDict["mixDataInfoList"] as? [Any] {
                    
                    if jsonArr.count > 0 {
                        
                        for dict in jsonArr {
                            
                            if let dataDict = dict as? [String : Any] {
                                
                                let type = dataDict["dataType"] as! String;
                                
                                if type == "D" {
                                    
                                    let model : RxParkDynimicModel = RxParkDynimicModel.mj_object(withKeyValues: dataDict);
                                 
                                    parkArr.append(model);
                                    
                                    try! weakSelf?.realm.write {
                                        
                                        weakSelf?.realm.add(model);
                                    }
                                    
                                }
                                
                                
                            }
                            
                        }
                        
                    }
                    
                }
                
                successBlock(parkArr as AnyObject);
                
                let puppies = weakSelf?.realm.objects(RxParkDynimicModel.self);
                
                print(puppies?.count);
                
            }
            
        }, fail: { (error) in
            
            if let failBlock = fail{
                
                failBlock(error);
                
                print(error);
            }
            
        }, progress: nil);
        
    }
}
