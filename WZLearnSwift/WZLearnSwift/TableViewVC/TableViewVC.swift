//
//  TableViewVC.swift
//  WZLearnSwift
//
//  Created by 李炜钊 on 2017/8/26.
//  Copyright © 2017年 wizet. All rights reserved.
//

import UIKit



class TableViewVC: WZBaseViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate
{
    var dataSourceArr : [Dictionary<String , String>] = [];
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.createData()
        self.createViews()
        
    }
    
    func createData() -> Void {
//        dataSourceArr = []
//
        //类型标志  cellID
        //类型对应的数据
        
        let dat1 : Dictionary<String , String> =
        [   "cellID" : String(describing: BCustomTableViewCell.self),
            "topTitle" : "今天天气不错啊",
            "bottomTitle" : "what the hell with you",
        ];
        dataSourceArr.append(dat1);
        
    }
    
    
    func createViews()
    {
        self.title = getLocalString(str: "你是猪吗")
        let table : UITableView = UITableView(frame: CGRect(x:0.0, y:self.subViewsOrigionY, width:UIScreen.main.bounds.size.width, height:UIScreen.main.bounds.size.height - self.subViewsOrigionY) , style: UITableViewStyle.plain);
        self.view.addSubview(table);
        
        table.backgroundColor = UIColor.green;
        table.delegate = self
        table.dataSource = self;
//        table.register(CCustomTableViewCell.classForCoder(), forCellReuseIdentifier: String(describing: CCustomTableViewCell.self))
        table.register(UINib.init(nibName: String(describing: BCustomTableViewCell.self), bundle: Bundle.main), forCellReuseIdentifier: String(describing: BCustomTableViewCell.self))
        
        table.register(UINib.init(nibName: String(describing: CustomTableViewCell.self), bundle: Bundle.main), forCellReuseIdentifier: String(describing: CustomTableViewCell.self))
        table.estimatedRowHeight = UITableViewAutomaticDimension;
        table.separatorStyle = .none;
        table.contentInset = UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0)
        table.showsVerticalScrollIndicator = false
        
    }
    
    //data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 100;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        var tableCell : UITableViewCell? = nil;
        var cellID : String? = nil;
        if (indexPath.row % 2) == 0 {
            cellID = String(describing: BCustomTableViewCell.self)
            tableCell = tableView.dequeueReusableCell(withIdentifier: cellID!)
            (tableCell as! BCustomTableViewCell).topLabel.text = String(indexPath.row)
            (tableCell as! BCustomTableViewCell).topLabel.backgroundColor = .yellow;
            
            let tmpStr : String = getLocalString(str: "啦啦啊啦啦啦啦啦啦啦啦")
            var tmpStr2 : String = "";
            //for 循环
            for _ in 0...indexPath.row {
                tmpStr2 = tmpStr2 + "\n" + tmpStr
            }
            
            (tableCell as! BCustomTableViewCell).bottomLabel.text = tmpStr2
            if tableCell == nil {
                tableCell = BCustomTableViewCell(style: .default, reuseIdentifier: cellID!);
            }
        } else {
            cellID = String(describing: CustomTableViewCell.self);
            tableCell = tableView.dequeueReusableCell(withIdentifier: cellID!)
            if tableCell == nil {
                tableCell = CustomTableViewCell(style: .default, reuseIdentifier: cellID!);
            }
            
            if indexPath.row == 1 || indexPath.row == 5 {
                (tableCell as! CustomTableViewCell).contentLabel.text =
                """
                一瞬(いっしゅん)うつるは あなたの优颜(ゆうがお)
                心(こころ)に 泳(およ)ぐ 金鱼(きんぎょ)は
                丑(みにく)さで 包(つつ)まれぬよう
                この夏(なつ)だけの 命(いのち)と 决(き)めて
                少(すこ)しの 时间(じかん)だけでも
                あなたの 幸(しあわ)せを 愿(ねが)ったの
                夏(なつ)の匂(にお)い 夜(よる)が包(つつ)んで
                ぽたぽたおちる 金鱼(きんぎょ)花火(はなび)
                どんな言叶(ことば)にも できない
                """
            } else {
                (tableCell as! CustomTableViewCell).contentLabel.text =
                """
                为何分手可以当做将誓愿半
                临行给我一句失去感觉我的天
                从聚到散不讲路线
                突然再见 别再见
                明明是我一人踏过
                行浪伴我 海湾中拍拖
                """
            }
        }
        
        if tableCell == nil {
            tableCell = UITableViewCell(style: .default, reuseIdentifier: String(describing: UITableViewCell.self))
        }
        
        tableCell?.selectionStyle = .none;
        
        return tableCell!
    }
    
    //貌似只能使用XIB了...
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension;
    }
   
  
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath);
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        
    }
    
    
}
