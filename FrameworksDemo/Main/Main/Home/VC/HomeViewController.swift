//
//  HomeViewController.swift
//  FrameworksDemo
//
//  Created by 肖志斌 on 2019/7/25.
//  Copyright © 2019 肖志斌. All rights reserved.
//

import UIKit
import BaseUIKitExtension
import GlobalConstants
import BaseNetwork

class HomeViewController: UIViewController {

    lazy var tableView:UITableView = {
        
        let tableView = UITableView.init(frame: CGRect.init(x: 0, y: navigationBarHeight, width: ScreenW, height: ScreenH  - navigationBarHeight), style: UITableView.Style.grouped)
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.rowHeight          = UITableView.automaticDimension
        tableView.estimatedRowHeight = 0
        tableView.estimatedSectionFooterHeight   = 0
        tableView.estimatedSectionHeaderHeight   = 0
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        }
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = ColorBackGround
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: "HomeTableViewCell")
        return tableView
        
    }();
    var dataArr = [homeModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "首页"
        self.view.backgroundColor = .white
        view.addSubview(tableView)
        self.loadData()
    }
    


}
///  MARK : 加载数据
extension HomeViewController {
   private func loadData(){
   
        HttpTool.shared.GetLocalJsonData(JsonPath: "home", success: { (data) in
            self.dataArr.removeAll()
            if let response = BaseHomeModel.deserialize(from: data){
                let array = response.data
                self.dataArr += array
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.tableView.reloadData()
                    
                }
                
            }
            
        }) { (error) in
            
        }
        
    }
}
///  MARK : tableViewDelegate
extension  HomeViewController  : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        cell.model = self.dataArr[indexPath.row]
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120 + ImageWidth
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    
    
    
}

// MARK: - UITableViewDelegate
extension HomeViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
