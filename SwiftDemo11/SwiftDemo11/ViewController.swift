//
//  ViewController.swift
//  SwiftDemo11
//
//  Created by jiaoyu on 2017/12/13.
//  Copyright © 2017年 viewhigh. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    private let cellHeight:CGFloat = 66
    private let colorRation:CGFloat = 10
    var table:UITableView!
    
    private let lyric = "when i was young i'd listen to the radio,waiting for my favorite songs,when they played i'd sing along,it make me smile,those were such happy times and not so long ago,how i wondered where they'd gone,but they're back again just like a long lost friend,all the songs i love so well,every shalala every wo'wo,still shines,every shing-a-ling-a-ling"
    private var dataSource:Array<String>!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        table = UITableView(frame: self.view.frame, style: .plain)
        self.view.addSubview(table)
        table.dataSource = self;
        table.delegate = self;
        table.separatorStyle = .none
        
        self.dataSource = lyric.split(separator: ",").map(String.init)
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        table.reloadData()
        let cells = table.visibleCells
        let tableHeight:CGFloat = table.bounds.size.height
        for (index,cel) in cells.enumerated() {
            cel.frame.origin.y = tableHeight
            UIView.animate(withDuration: 1.0, delay: 0.04 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
                    cel.frame.origin.y = 0
            }, completion: nil)
        }
        
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "reuseID")
        cell.textLabel?.text = self.dataSource[indexPath.row]
        cell.textLabel?.textColor = UIColor.white
        let bgView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.cellHeight))
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bgView.frame
        let lowerColor:CGColor = UIColor(red: 1.0, green: (CGFloat(indexPath.row * 2) * self.colorRation)/255.0, blue: (CGFloat(indexPath.row * 2) * self.colorRation)/255.0, alpha: 1).cgColor
        let upperColor:CGColor = UIColor(red: 1.0, green: (CGFloat(indexPath.row * 2) * self.colorRation + self.colorRation)/255.0, blue: (CGFloat(indexPath.row * 2) * self.colorRation + self.colorRation)/255.0, alpha: 1).cgColor
        gradientLayer.colors = [lowerColor,upperColor]
        bgView.layer.addSublayer(gradientLayer)
        cell.addSubview(bgView)
        cell.sendSubview(toBack: bgView)
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

