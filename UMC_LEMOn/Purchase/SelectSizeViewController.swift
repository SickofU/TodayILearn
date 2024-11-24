import UIKit

class SelectSizeViewController: UIViewController {
    
    let selectSizeView = SelectSizeView()
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        view.addSubview(selectSizeView)
        
        selectSizeView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(400)  // 높이 설정
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectSizeView.closeButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
    }
    
    @objc private func dismissView() {
        dismiss(animated: true, completion: nil)
    }
}

