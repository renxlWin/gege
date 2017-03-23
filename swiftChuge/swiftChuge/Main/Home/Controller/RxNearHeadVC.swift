//
//  RxNearHeadVC.swift
//  swiftChuge
//
//  Created by RXL on 17/3/22.
//  Copyright © 2017年 RXL. All rights reserved.
//

import UIKit
import Alamofire

class RxNearHeadVC: RxBaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareUI();
        
        loadInfo();
        
    }
    
    
    lazy var tableView : UITableView = {
       
        let tableView = UITableView(frame: CGRect() ,style: .plain)
        
        tableView.separatorStyle = .none;
        
        tableView.delegate = self;
        
        tableView.dataSource = self;
        
        return tableView;
        
    }()
    
    
    lazy var headImg : UIImageView = {
        
        let headImgView = UIImageView(image: UIImage(named: "appointDynamic"))
        
        return headImgView;
    }()
    
    lazy var bottomImg : UIImageView = {
        
        let bottomImg = UIImageView(image: UIImage(named: "sekuai"))
        
        return bottomImg;
    }()
    
    lazy var tipLabel : UILabel = {
        
        let tipLabel = UILabel();
        
        tipLabel.text = "附近的新鲜事";
        
        tipLabel.textColor = UIColor.white;
        
        tipLabel.font = UIFont.systemFont(ofSize: 12);
        
        return tipLabel;
    }()
}

extension RxNearHeadVC {
    
    func loadInfo(){
        
        let urlStr = SERVER_URL_Date.appending("user/datemanagenet/rollMessage/v1");
        
        let emptyString = "a";
        
        RxNetManager.post(urlStr, parameters: ["type":emptyString], progress: nil, success: { (task, responseObject) in
            
            print(responseObject);
            
        }) {  (task, error) in
            
            print(error);
        };
        
    }
    
}

extension RxNearHeadVC {
    
    func prepareUI(){
        
        view.backgroundColor = UIColor.white;
        view.addSubview(headImg);
        view.addSubview(tableView);
        
        headImg.snp.makeConstraints { (make) in
            
            make.leading.equalTo(view).offset(20);
            
            make.top.equalTo(view).offset(10);
            
            
            make.size.equalTo((headImg.image?.size)!);
        };
        
        let lineView = UIView();
        
        lineView.backgroundColor = lineColor;
        
        view.addSubview(lineView);
        
        lineView.snp.makeConstraints { (make) in
            
            make.leading.equalTo(headImg.snp.trailing).offset(20);
            
            make.top.bottom.equalTo(headImg);
            
            make.width.equalTo(1);
        };
        
        tableView.snp.makeConstraints { (make) in
            
            make.bottom.top.equalTo(headImg);
            
            make.leading.equalTo(lineView.snp.trailing).offset(20);
            
            make.trailing.equalTo(view);
        };
        
        let lineViewTwo = UIView();
        
        lineViewTwo.backgroundColor = lineColor;
        
        view.addSubview(lineViewTwo);
        
        lineViewTwo.snp.makeConstraints { (make) in
            
            make.top.equalTo(headImg.snp.bottom).offset(10)
            
            make.trailing.leading.equalToSuperview();
            
            make.height.equalTo(10);
        };
        
        view.addSubview(bottomImg);
        
        bottomImg.snp.makeConstraints { (make) in
            
            make.leading.equalTo(view);
            
            make.top.equalTo(lineViewTwo.snp.bottom).offset(5);
            
            make.bottom.equalToSuperview();
            
        };
        
        bottomImg.addSubview(tipLabel);
        
        tipLabel.snp.makeConstraints { (make) in
            
            make.center.equalToSuperview();
            
        };
        
    }

}

extension RxNearHeadVC : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return 100;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = RxHomeHeadCell.cellWithTableView(tableView: tableView);
        
        return cell;
    }
    
}
