import UIKit

class PurchaseViewController: UIViewController {
    
    let purchaseView = PurchaseView()
    
    override func loadView() {
        view = purchaseView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }
    
    @objc private func showSelectSizeView() {
        let selectSizeVC = SelectSizeViewController()
        selectSizeVC.modalPresentationStyle = .overFullScreen
        present(selectSizeVC, animated: true, completion: nil)
    }
}

