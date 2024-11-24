//
//  BaseViewController.swift
//  week2
//
//  Created by 손현빈 on 10/3/24.
//

import UIKit

class BaseViewController: UITabBarController {
    
    
    // 탭바 모델 창들 어디어디 구현될지
    private let home = HomeViewController()
    private let style = StyleViewController()
    private let shop = ShopViewController()
    private let saved = SavedViewController()
    private let my = UINavigationController(rootViewController: myViewController() )
    
 
    
    override func viewDidLoad(){
        super.viewDidLoad()
        view.backgroundColor = .white
        
    
         home.tabBarItem = UITabBarItem(title : "HOME", image : UIImage(systemName: "star"), tag : 1)
        style.tabBarItem = UITabBarItem(title : "STYLE", image : UIImage(systemName : "house"), tag : 2)
        shop.tabBarItem = UITabBarItem(title : "SHOP", image : UIImage (systemName : "cart"), tag : 3)
        saved.tabBarItem = UITabBarItem(title : "SAVED", image : UIImage (systemName : "bookmark"), tag : 4)
        my.tabBarItem = UITabBarItem(title : "MY", image : UIImage (systemName : "person.crop.circle"), tag : 5)
        
        
        self.viewControllers = [home,style,shop ,saved, my]
        
    }
    
    /// 클릭 시, 검은색으로 칠해지도록 Aprrearance 조정 함수
       private func appearance() {
           let barAppearance = UITabBarAppearance()
           barAppearance.stackedLayoutAppearance.selected.iconColor = UIColor.black
           barAppearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.black]
           barAppearance.stackedLayoutAppearance.selected.badgeBackgroundColor = UIColor.black
           barAppearance.stackedLayoutAppearance.normal.badgeBackgroundColor = UIColor.black
           
           self.tabBar.standardAppearance = barAppearance
           self.tabBar.backgroundColor = .clear
       }

}
