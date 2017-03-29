//
//  RxParkDynimicModel.swift
//  swiftChuge
//
//  Created by RXL on 17/3/29.
//  Copyright © 2017年 RXL. All rights reserved.
//

import UIKit

class RxParkDynimicModel: NSObject {

    var userId : String?;
    
    var nickName : String?;
    
    var gender : String?;
    
    var birth : String?;
    
    var personalCredit : String?;
    
    var userHeadPhoto : String?;
    
    var createTime : String?;
    
    var point : Dictionary<String, Any>?;
    
    var content : String?;
    
    var imageArray : Array<Any>?;
    
    var likeCount : String?;
    
    var address : String?;
    
    var paymentAuthentication : String?;
    
    var commentCount : String?;
    
    var city : String?;
    
    var doLike : Bool?;
    
    var dataType : String?;
    
    
    override static func mj_replacedKeyFromPropertyName() -> [AnyHashable : Any]! {
        return [
            "imageArray":"photos",
            "userId":"userMDB.userId",
            "nickName" : "userMDB.nickName",
            "gender" : "userMDB.gender",
            "birth" : "userMDB.birth",
            "personalCredit" : "userMDB.personalCredit",
            //             "userHeadPhoto" : "userHeadPhoto",
            "createTime" : "dynamicDetailMDB.createTime",
            "point" : "dynamicDetailMDB.point",
            "city" : "dynamicDetailMDB.city",
            "content" : "dynamicDetailMDB.content",
            "likeCount" : "dynamicDetailMDB.likeCount",
            "commentCount" : "dynamicDetailMDB.commentCount",
            "dynamicId":"dynamicDetailMDB.id",
            "address":"dynamicDetailMDB.address",
            "anonymous":"dynamicDetailMDB.anonymous",
            "paymentAuthentication":"userMDB.paymentAuthentication"
        ];
    }
}
