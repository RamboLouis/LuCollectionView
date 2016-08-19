//
//  ViewController.swift
//  LuCollectionView
//
//  Created by 路政浩 on 16/7/24.
//  Copyright © 2016年 路政浩. All rights reserved.
//

import UIKit

private let IndexPath = "indexPath"
private let H :CGFloat = 100

class ViewController: UIViewController {
    
    var modelArr: [Model] = [Model]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let array = [["named":""],["named":""],["named":""]]
        
        for dict in array {
            
            let model = Model()
            
            model.imageName = dict["named"]
            
            modelArr.append(model)
        }
        
        print(modelArr)
        
        
        setupUI()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    lazy var Luview: UIView = {
        
        let view = UIView()
        view.frame = CGRectMake(0, 200, UIScreen.mainScreen().bounds.size.width, 100)
        view.backgroundColor = UIColor.whiteColor()
        
        return view
        
    }()
    
    
    lazy var ColltionViewS: UIView = {
        
        let Layout = UICollectionViewFlowLayout()
        
        Layout.itemSize = CGSize(width: 205, height: 100)
        Layout.scrollDirection = .Horizontal
        // 缩进
        Layout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 0)
        //每个item在水平方向的最小间距
        Layout.minimumLineSpacing = 20
        
        let ColltionView = UICollectionView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width, 100), collectionViewLayout: Layout)
        
        ColltionView.backgroundColor = UIColor.whiteColor()
        ColltionView.delegate = self
        ColltionView.dataSource = self

        ColltionView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
        ColltionView.registerClass(CollectionViewCell.self, forCellWithReuseIdentifier: IndexPath)
        
        return ColltionView
    }()
    
}
extension ViewController {
    
    private func setupUI() {
        self.view.addSubview(Luview)
        Luview.addSubview(ColltionViewS)
    }
    
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return modelArr.count ?? 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(IndexPath, forIndexPath: indexPath) as! CollectionViewCell
        
        cell.model = modelArr[indexPath.row]
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        print("这是第\(indexPath.row)个 item")
        
    }
    
}


