import UIKit
import SnapKit

class HomeViewController: UIViewController {

    // HomeView 인스턴스 생성
    lazy var homeView: HomeView = {
        let view = HomeView()
        return view
    }()

    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view = homeView
        registerCells()
        setupCollectionViewDataSources()
    }

    // 셀 클래스 등록 메서드
    private func registerCells() {
        homeView.TopCollectionView.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.identifier)
        homeView.newProductCollectionView.register(NewProductCell.self, forCellWithReuseIdentifier: NewProductCell.identifier)
        homeView.bottomCollectionView.register(BottomCell.self, forCellWithReuseIdentifier: BottomCell.identifier)
    }

    // 컬렉션 뷰의 데이터 소스 및 델리게이트 설정 메서드
    private func setupCollectionViewDataSources() {
        homeView.TopCollectionView.dataSource = self
        homeView.newProductCollectionView.dataSource = self
        homeView.bottomCollectionView.dataSource = self

        homeView.TopCollectionView.delegate = self
        homeView.newProductCollectionView.delegate = self
        homeView.bottomCollectionView.delegate = self
    }
}

//  - UICollectionViewDataSource, UICollectionViewDelegate
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == homeView.TopCollectionView {
            return categoryData.count
        } else if collectionView == homeView.newProductCollectionView {
            return newProductData.count
        } else if collectionView == homeView.bottomCollectionView {
            return bottomData.count
        }
        return 0
    }
//error
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == homeView.TopCollectionView {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: CategoryCell.identifier,
                for: indexPath) as? CategoryCell else {
                   
                    return UICollectionViewCell()
            }
            
            let data = categoryData[indexPath.row]
            cell.configure(imageName: data.image, name: data.name)
            return cell
        } else if collectionView == homeView.newProductCollectionView {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: NewProductCell.identifier,
                for: indexPath) as? NewProductCell else {
                 
                    return UICollectionViewCell()
            }
            
            let data = newProductData[indexPath.row]
            cell.configure(imageName: data.image, brand: data.brand, productName: data.name, price: data.nowPrice)
            return cell
        } else if collectionView == homeView.bottomCollectionView {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: BottomCell.identifier,
                for: indexPath) as? BottomCell else {
                    
                    return UICollectionViewCell()
            }
            let data = bottomData[indexPath.row]
            cell.configure(imageName: data)
            return cell
        }
        return UICollectionViewCell()
    }
}

