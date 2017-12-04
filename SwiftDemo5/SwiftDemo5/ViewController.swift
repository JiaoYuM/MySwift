//
//  ViewController.swift
//  SwiftDemo5
//
//  Created by jiaoyu on 2017/12/4.
//  Copyright © 2017年 viewhigh. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{

    var dataSource = Array<Date>()
    let refresh = UIRefreshControl()
    var table: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        table = UITableView(frame: self.view.bounds)
        self.view.addSubview(table)
        table.delegate = self
        table.dataSource = self
        table.rowHeight = 50
        addNewElementToArray()
        refresh.attributedTitle = NSAttributedString(string: "下来吧！")
        refresh.addTarget(self, action: #selector(pullTableRefresh), for: UIControlEvents.valueChanged)
        table.addSubview(refresh)
        table.reloadData()

    }

    @objc func pullTableRefresh() {
        addNewElementToArray()
        refresh.endRefreshing()
        table.reloadData()
    }
    
    @objc func addNewElementToArray() {
        dataSource.insert(NSDate() as Date, at: 0)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "reuseCellForPullToRefresh")
        
        let dataFormater = DateFormatter()
        dataFormater.dateFormat = "yyyy年MM月dd日/HH时mm分ss秒"
        let dateStr = dataFormater.string(from: dataSource[indexPath.row])
        cell.textLabel?.text = dateStr
        return cell
    
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

