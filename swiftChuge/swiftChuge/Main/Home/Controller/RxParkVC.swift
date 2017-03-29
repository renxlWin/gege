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
    
    lazy var parkArr : [Any] = {
       
        let arr = [Any]()
        
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
        
        RxParkManager.loadParkData(parkPage: parkPage, success: { [weak self](response) in
            
            self?.tableView.mj_header.endRefreshing();
            
            self?.tableView.mj_footer.endRefreshing();
            
            if let modelArr = response as? [Any] {
                
                for model in modelArr{
                    
                    self?.parkArr.append(model);
                }
                
                self?.tableView.reloadData();
            }
            
            
        }, fail: {  [weak self]
            (error) in
            
            self?.tableView.mj_header.endRefreshing();
            
            self?.tableView.mj_footer.endRefreshing();
            
            SVProgressHUD.showError(withStatus: "网络错误");
            
        }, progress: nil)
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
