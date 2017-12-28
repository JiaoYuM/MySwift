//
//  MenuViewController.swift
//  SwiftDemo22
//
//  Created by jiaoyu on 2017/12/27.
//  Copyright © 2017年 viewhigh. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController ,UITableViewDelegate ,UITableViewDataSource {

    var dataSource: Array<String>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let table = UITableView(frame: self.view.frame)
        table.delegate = self
        table.dataSource = self
        self.view.addSubview(table)
        dataSource = ["Menu one","Menu two","Menu three","Menu four"]
        
        // Do any additional setup after loading the view.
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "reusedCell")
        cell.textLabel?.text = dataSource[indexPath.row]
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
