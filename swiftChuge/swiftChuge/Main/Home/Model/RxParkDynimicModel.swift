//
//  RxParkDynimicModel.swift
//  swiftChuge
//
//  Created by RXL on 17/3/29.
//  Copyright © 2017年 RXL. All rights reserved.
//

import UIKit
import RealmSwift

class RxParkDynimicModel: Object {

    dynamic var dynamicId : String?
    
    dynamic var userId : String?;
    
    dynamic var nickName : String?;
    
    dynamic var gender : String?;
    
    dynamic var birth : String?;
    
    dynamic var personalCredit : String?;
    
    dynamic var userHeadPhoto : String?;
    
    dynamic var createTime : String?;
    
//    dynamic var point : Dictionary<String, Any>?;
    
    dynamic var content : String?;
    
//    dynamic var imageArray : Array<Any>?;
    
    dynamic var likeCount : String?;
    
    dynamic var address : String?;
    
    dynamic var paymentAuthentication : String?;
    
    dynamic var commentCount : String?;
    
    dynamic var city : String?;
    
    var doLike : RealmOptional<Bool>?;
    
    dynamic var dataType : String?;
    
    override static func primaryKey() -> String? {
        return "dynamicId"
    }


    
    override static func mj_replacedKeyFromPropertyName() -> [AnyHashable : Any]! {
        return [
            "imageArray":"photos",
            "userId":"userMDB.userId",
            "nickName" : "userMDB.nickName",
            "gender" : "userMDB.gender",
            "birth" : "userMDB.birth",
            "personalCredit" : "userMDB.personalCredit",
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
