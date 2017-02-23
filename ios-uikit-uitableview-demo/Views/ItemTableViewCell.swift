//
//  ItemTableViewCell.swift
//  ios-uikit-uitableview-demo
//
//  Created by Kushida　Eiji on 2017/02/24.
//  Copyright © 2017年 Kushida　Eiji. All rights reserved.
//

import UIKit

final class ItemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var thumImageView: UIImageView!
    
    static var identifier: String {
        get {
            return String(describing: self)
        }
    }
    
    var item: Item? {
        
        didSet {
            self.titleLabel.text = item?.title
            
            if let imageFileName = item?.thumImageFileName {
                self.thumImageView.image = UIImage.init(named: imageFileName)
            }
        }
    }
    
}
