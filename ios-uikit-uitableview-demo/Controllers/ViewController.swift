//
//  ViewController.swift
//  ios-uikit-uitableview-demo
//
//  Created by Kushida　Eiji on 2017/02/24.
//  Copyright © 2017年 Kushida　Eiji. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let dataSource = ItemProvider()
    let items = [Item(title: "月曜日", thumImageFileName: "Mon"),
                 Item(title: "火曜日", thumImageFileName: "Thu")]

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        setupTableView()
        dataSource.setItems(items: items)
    }
    
    private func setupTableView() {
        tableView.dataSource = dataSource
    }
}

extension ViewController: UITableViewDelegate {
    
    /// セルが選択されたときに呼ばえる
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("section: \(indexPath.section) - row: \(indexPath.row)")
    }
}
