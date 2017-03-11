# ios-uikit-uitableview-demo
iOS UITableViewのデモ(Swift3)

## 実装サンプル

### ViewController

```
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
```

### View

```
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
```

```
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
```

### Model

```
import Foundation

struct Item {
    var title = ""
    var thumImageFileName = ""
}
```
