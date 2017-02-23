//
//  ItemProvider.swift
//  ios-uikit-uitableview-demo
//
//  Created by Kushida　Eiji on 2017/02/24.
//  Copyright © 2017年 Kushida　Eiji. All rights reserved.
//

import UIKit

final class ItemProvider: NSObject, UITableViewDataSource {
    
    var items: [Item] = []
    
    func setItems(items: [Item]) {
        self.items = items
    }
    
    /// セルの数を返す
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    /// セルを組み立てる
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ItemTableViewCell.identifier,
                                             for: indexPath) as! ItemTableViewCell
        cell.item = items[indexPath.row]
        return cell
    }
    
}
