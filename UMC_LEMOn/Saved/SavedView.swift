//
//  SavedView.swift
//  week2
//
//  Created by 손현빈 on 11/3/24.
//
import UIKit

class SavedView: UIView {
    
    override init (frame: CGRect){
        super.init(frame: frame)
        setViews()
        setConstraints()
    }
    
    //사진 들어갈 공간
    let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        return imageView
    }()
    
    // 타이틀
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "saved"
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    // 작은 설명
    lazy var numberOfCells: UILabel = {
           let label = UILabel()
           label.text = "전체 10개"
           label.font = UIFont.systemFont(ofSize: 14)
           return label
       }()
    
    lazy var productTableView: UITableView = {
          let tableView = UITableView()
          tableView.register(SaveCell.self, forCellReuseIdentifier: SaveCell.identifier)
          tableView.separatorStyle = .singleLine
          return tableView
      }()
    
    private func setViews() {
           self.addSubview(titleLabel)
           self.addSubview(numberOfCells)
           self.addSubview(productTableView)
       }
   
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
    private func setConstraints(){
        titleLabel.snp.makeConstraints { make in
                 make.top.equalTo(safeAreaLayoutGuide).offset(16)
                 make.left.equalToSuperview().offset(10)
             }

             numberOfCells.snp.makeConstraints { make in
                 make.top.equalToSuperview().offset(122)
                 make.left.equalToSuperview().offset(13)
             }

             productTableView.snp.makeConstraints { make in
                 make.top.equalTo(numberOfCells.snp.bottom).offset(12)
                 make.left.right.equalToSuperview()
                 make.bottom.equalTo(self.safeAreaLayoutGuide)
             }
             
         
    }
    
}

