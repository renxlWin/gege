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
    
}
