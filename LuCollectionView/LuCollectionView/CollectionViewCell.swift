//
//  CollectionViewCell.swift
//  LuCollectionView
//
//  Created by 路政浩 on 16/8/19.
//  Copyright © 2016年 路政浩. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    
    var model: Model? {
        didSet{
            
            print("这是model的属性: \(model?.imageName)")
            
            imageView.image = UIImage(named: model?.imageName ?? "")
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        backgroundColor = UIColor ( red: 0.702, green: 0.702, blue: 0.702, alpha: 1.0 )
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var imageView: UIImageView = {
        let imageV = UIImageView()
        imageV.userInteractionEnabled = true
        
        return imageV
    }()
    
    
}

extension CollectionViewCell {
    
    private func setupUI() {
        
        imageView.frame = self.bounds
        
        contentView.addSubview(imageView)
        
    }
    
    
    
    
}
