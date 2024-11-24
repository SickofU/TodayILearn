import UIKit

class myViewController : UIViewController, MyPageViewDelegate
{
    private let MyPageView = myPageView()
        
    weak var delegate: MyPageViewDelegate?
    
    
    override func viewDidLoad() {
            super.viewDidLoad()
            self.view = MyPageView
            MyPageView.delegate = self
            setNavigationBar()
        }
    // 네비게이션 바 
    private func setNavigationBar(){
            
            let gearImage = UIImage(named: "Gear_icon")
            let cameraImage = UIImage(named: "Camera_icon")
        
            let settiongButton = UIBarButtonItem(image: gearImage)
            let cameraButton = UIBarButtonItem(image: cameraImage)
           
            settiongButton.tintColor = .black
            cameraButton.tintColor = .black
            
            navigationItem.leftBarButtonItem = settiongButton
            navigationItem.rightBarButtonItem = cameraButton
        }
    
}

extension myViewController {
    func didTapEditProfileButton() {
        let viewController = EditProfileViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}
