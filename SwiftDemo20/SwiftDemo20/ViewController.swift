//
//  ViewController.swift
//  SwiftDemo20
//
//  Created by jiaoyu on 2017/12/26.
//  Copyright © 2017年 viewhigh. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{

    let cellHeight:CGFloat = 66
    var table : UITableView!
    let dataSource = ["Position","Opacity","Scale","Color","Rotation"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table = UITableView(frame: self.view.frame, style: .plain)
        table.delegate = self
        table.dataSource = self
        self.view.addSubview(table)
        table.separatorStyle = .singleLine
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "reuseCell")
        cell.textLabel?.text = self.dataSource[indexPath.row]
        cell.textLabel?.textColor = UIColor.black
        cell.frame.origin.y = self.cellHeight
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            self.navigationController?.pushViewController(PositionAnimationViewController(), animated: true)
        case 1:
            self.navigationController?.pushViewController(OpacityAnimationViewController(), animated: true)
        case 2:
            self.navigationController?.pushViewController(ScaleAnimationViewController(), animated: true)
        case 3:
            self.navigationController?.pushViewController(ColorAnimationViewController(), animated: true)
        case 4:
            self.navigationController?.pushViewController(RotationAnimationViewController(), animated: true)
        default:
            break
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

