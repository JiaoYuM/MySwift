//
//  ViewController.swift
//  SwiftDemo9
//
//  Created by jiaoyu on 2017/12/11.
//  Copyright © 2017年 viewhigh. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UIActionSheetDelegate {

    let cellHeight:CGFloat = 66
    let colorRatio:CGFloat = 10

    var table:UITableView!
    var dataSource:Array<String>!
    var actionController:UIAlertController!
    let lyric = "when i was young i'd listen to the radio,waiting for my favorite songs,when they played i'd sing along,it make me smile,those were such happy times and not so long ago,how i wondered where they'd gone,but they're back again just like a long lost friend,all the songs i love so well,every shalala every wo'wo,still shines,every shing-a-ling-a-ling"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table = UITableView(frame: self.view.frame, style: .plain)
        table.delegate = self;
        table.dataSource = self;
        table.separatorStyle = .none
        self.view.addSubview(table)
        
        //split函数把String按","截取 得到子字符串的数组
        dataSource = lyric.split(separator: ",").map(String.init)
        
        actionController = UIAlertController(title: "", message: "", preferredStyle: .alert)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        table.reloadData()
        
        let cells = table.visibleCells
        
        let tableHeight:CGFloat = table.bounds.size.height
        
        for (index,cell) in cells.enumerated() {
            
            cell.frame.origin.y = tableHeight
            UIView.animate(withDuration: 1.0, delay: 0.04 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
                
                cell.frame.origin.y = 0
            }, completion: nil)
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        let cell = UITableViewCell(style: .default, reuseIdentifier: "animationInTableViewCell")
        cell.textLabel?.text = self.dataSource[indexPath.row]
        cell.textLabel?.textColor = UIColor.white
        let bgview = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.cellHeight))
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bgview.frame
        
        let lowerColor:CGColor = UIColor(red:CGFloat(CGFloat(indexPath.row * 2) * self.colorRatio) / 255.0, green: 1.0, blue: (CGFloat(indexPath.row * 2) * self.colorRatio) / 255.0, alpha: 1).cgColor
        
        let uperColor:CGColor = UIColor(red: (CGFloat(indexPath.row * 2) * self.colorRatio + self.colorRatio)/255.0, green: 1.0, blue: (CGFloat(indexPath.row * 2) * self.colorRatio + self.colorRatio)/255.0, alpha: 1).cgColor
        gradientLayer.colors = [lowerColor , uperColor]
        bgview.layer.addSublayer(gradientLayer)
        cell.addSubview(bgview)
        cell.sendSubview(toBack: bgview)
        cell.frame.origin.y = self.cellHeight
        
        cell.isUserInteractionEnabled = true
        
        
        return cell
    }
    //左滑
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let likeAction = UITableViewRowAction(style: .normal, title: "👍") { (action, index) in
            self.actionController.message = "Thanks for your Love😸"
            self.showAlertController()
        }
        likeAction.backgroundColor = UIColor.white
        
        
        let dislikeAction = UITableViewRowAction(style: .default, title: "👎") { action, index in
            self.actionController.message = "Tell me why!!!😤"
            self.showAlertController()
            print("done")
        }
        dislikeAction.backgroundColor = UIColor.white
        
        let unknowAction = UITableViewRowAction(style: .destructive, title: "🖖") { (action, index) in
            self.actionController.message = "What do you mean? 🤔"
            self.showAlertController()
            print("what?")
        }
        unknowAction.backgroundColor = UIColor.white
        return [likeAction, dislikeAction,unknowAction]
    }
    
    
    func showAlertController() {
        self.present(self.actionController, animated: true, completion: {
            let dismissTimer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false, block: { (timer) in
                self.actionController.dismiss(animated: true, completion: nil)
            })
            RunLoop.main.add(dismissTimer, forMode: .commonModes)
        })
    }
    
}

