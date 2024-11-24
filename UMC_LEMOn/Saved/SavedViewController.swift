import UIKit

class SavedViewController : UIViewController {
    
    let data = SavedProductData.productdatas
    
    lazy var savedView: SavedView = {
            let view = SavedView()
            view.numberOfCells.text = "전체  \(data.count) 개"
            view.productTableView.dataSource = self
            view.productTableView.delegate = self
            return view
        }()
    // dataSource = self, delegate = self 부분이 없으면 아예 테이블뷰 셀이 생성이 안됌
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = savedView
    }
    
   
}
// delegate, datasource 추가 설정

extension SavedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 103 // 원하는 높이 설정
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SaveCell.identifier, for: indexPath) as? SaveCell else {
            return UITableViewCell()
        }
        cell.configure(model: data[indexPath.row])
        return cell
    }
    

}
