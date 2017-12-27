//
//  MenuViewController.swift
//  SwiftDemo21
//
//  Created by jiaoyu on 2017/12/27.
//  Copyright © 2017年 viewhigh. All rights reserved.
//

import UIKit

class MenuViewController: SWRevealViewController,UITableViewDelegate,UITableViewDataSource {
    
    var dataSource : Array<String>!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.isNavigationBarHidden = true
        dataSource = ["AnimatedCell","Slot Machine","Limited Input"]
        let table = UITableView(frame: self.view.frame, style: .plain)
        table.dataSource = self
        table.delegate = self
        self.view.addSubview(table)
        
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "reusedCell")
        
        cell.textLabel?.text = dataSource[indexPath.row]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var viewController : UIViewController!
        switch indexPath.row {
        case 0:
            viewController = ViewController()
        case 1:
            viewController = SecondViewController()
        case 2:
            viewController = ThirdViewController()
        default:
            break
        }
        
        let navigationController = UINavigationController(rootViewController: viewController)
        
        self.revealViewController().pushFrontViewController(navigationController, animated: true)
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
