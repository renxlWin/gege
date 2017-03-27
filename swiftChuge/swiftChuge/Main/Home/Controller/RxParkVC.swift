//
//  RxParkVC.swift
//  swiftChuge
//
//  Created by RXL on 17/3/22.
//  Copyright © 2017年 RXL. All rights reserved.
//

import UIKit

class RxParkVC: RxBaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        prepareUI();
        
        tableView.mj_header.beginRefreshing();
    }
    
    var parkPage = 1;
    
    lazy var headVC : RxNearHeadVC = {
        
        let headVC = RxNearHeadVC();
        
        headVC.view.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: screenWidth, height: 99));
        
        return headVC;
    }()
    
    lazy var tableView : UITableView = {
       
        let tableView = UITableView(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: screenWidth, height: self.view.bounds.height - 108)), style: .plain);
        
        tableView.delegate = self;
        
        tableView.dataSource = self;
        
        tableView.separatorStyle = .none;
        
        tableView.backgroundColor = UIColor.white;
        
        tableView.tableHeaderView = self.headVC.view;
        
        weak var weakSelf = self;
        
        tableView.mj_header = MJRefreshNormalHeader(refreshingBlock: { 
            
            weakSelf?.parkPage = 1;
            
            weakSelf?.loadParkData();
            
        });
        
        tableView.mj_footer = MJRefreshBackNormalFooter(refreshingBlock: {
           
            weakSelf?.parkPage += 1;
            
            weakSelf?.loadParkData();
        });
        
        return tableView;
    }()
    
    lazy var parkArr : NSMutableArray = {
       
        let arr = NSMutableArray()
        
        return arr;
    }()
    
    lazy var parkIdArr : NSMutableArray = {
        
        let arr = NSMutableArray()
        
        return arr;
    }()
}


extension RxParkVC {
    
    func prepareUI() {
        
        view.addSubview(tableView);
        
    }
    
    func loadParkData() {
        
        if !checkLocationStatus!() {
            
            tableView.mj_header.endRefreshing();
            
            tableView.mj_footer.endRefreshing();
            
            return;
        }
        
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
        
    }
}

extension RxParkVC : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return parkArr.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: "park");
        
        cell.textLabel?.text = String(format: "%d", arguments: [indexPath.row]);
        
        return cell;
    }
    
    
}
