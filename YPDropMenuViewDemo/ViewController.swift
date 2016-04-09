//
//  ViewController.swift
//  YPDropMenuViewDemo
//
//  Created by 小黑 on 16/4/9.
//  Copyright © 2016年 王云鹏. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configMenuView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    private func configMenuView(){
        WOWDropMenuSetting.columnTitles = ["综合排序","筛选","快递"]
        WOWDropMenuSetting.rowTitles =  [
            ["销量","价格","信誉","性价比高","口碑超赞"],
            ["热销的咯","推荐","进口保证","美国"],
            ["申通","圆通速递","韵达","德邦"]
        ]
        WOWDropMenuSetting.maxShowCellNumber = 4
        WOWDropMenuSetting.columnEqualWidth = true
        WOWDropMenuSetting.cellTextLabelSelectColoror = UIColor.redColor()
        WOWDropMenuSetting.showDuration = 0.2
        let menuView = WOWDropMenuView(frame:CGRectMake(0,64,UIScreen.mainScreen().bounds.size.width,44))
        menuView.delegate = self
        view.addSubview(menuView)
    }
    
}

extension ViewController:DropMenuViewDelegate{
    func dropMenuClick(column: Int, row: Int) {
        debugPrint("点击了第\(column)列第\(row)行")
    }
}