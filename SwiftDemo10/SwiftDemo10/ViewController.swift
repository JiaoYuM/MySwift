//
//  ViewController.swift
//  SwiftDemo10
//
//  Created by jiaoyu on 2017/12/12.
//  Copyright © 2017年 viewhigh. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var table:UITableView!
    var bgImageview:UIImageView!
    private let cellHeight:CGFloat = 66
    private let lyric = "when i was young i'd listen to the radio,waiting for my favorite songs,when they played i'd sing along,it make me smile"
    private var dataSource:Array<String>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        table = UITableView()
        table.frame = CGRect(x: 0, y: self.view.frame.width + 10, width: self.view.frame.width, height: self.view.frame.height - 10 - self.view.frame.width)
        
        table.dataSource = self;
        table.delegate = self;
        table.separatorStyle = .none
        table.rowHeight = self.cellHeight
        self.view.addSubview(table)
        
        bgImageview = UIImageView(image: #imageLiteral(resourceName: "banner.jpg"))
        bgImageview.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.width + 10)
        self.view.addSubview(bgImageview)
        
        self.dataSource = self.lyric.split(separator: ",").map(String.init)
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        table.reloadData()
        
        let cells = table.visibleCells
        let  tableHeight:CGFloat = table.bounds.size.height
        
        for (index,cell) in cells.enumerated() {
            cell.frame.origin.y  = tableHeight
            UIView.animate(withDuration: 1.0, delay: 0.04 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: []
                , animations: { 
                    cell.frame.origin.y = 0;
            }, completion: nil)
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "reuseTableviewCell")
        cell.textLabel?.text = self.dataSource[indexPath.row]
        cell.textLabel?.textColor = UIColor.black
        cell.selectionStyle = .none
        return cell
        
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        print("\(offsetY)")
        let maxOffsetY = table.frame.height
        let validateOffsetY = -offsetY / maxOffsetY
        let scaleFactor = 1 + validateOffsetY
        bgImageview.transform = CGAffineTransform(scaleX: scaleFactor, y: scaleFactor)
    }
    
    
}

