//
//  TypeViewController.swift
//  BonusCalculate
//
//  Created by jiaoyu on 2018/1/24.
//  Copyright © 2018年 viewhigh. All rights reserved.
//

import UIKit

typealias CloseType = (String) -> Void

class TypeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    public var dataSource = Array<String>()
    
    var selectedType:CloseType!
    
    var table:UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        table = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        
        table.delegate = self
        table.dataSource = self
        table.rowHeight = 60
        self.view.addSubview(table)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "TypeCell")
        cell.textLabel?.text = dataSource[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let str = dataSource[indexPath.row]
        selectedType(str)
        self.navigationController?.popViewController(animated: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
