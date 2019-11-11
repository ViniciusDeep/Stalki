//
//  ContributorsCell.swift
//  Stalki
//
//  Created by Vinicius Mangueira on 10/11/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Reusable

class ContributorsCell: UITableViewCell, ConfigurableView {
  
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(cellType: ContributorCollectionViewCell.self)
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                layout.scrollDirection = .horizontal
        }
        collectionView.backgroundColor = .backgroundColor
        return collectionView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
          addSubviews([collectionView])
    }
      
    func setupConstraints() {
        collectionView.cBuild(make: .fillSuperview)
    }
    
}

extension ContributorsCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: ContributorCollectionViewCell.self)
        return cell
    }
}


class ContributorCollectionViewCell: UICollectionViewCell, Reusable, ConfigurableView {
 
    let contribuitorImage = RoundImage(frame: .zero).with(\.image, setValueToProperty: UIImage(named: "devxoul"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        addSubviews([contribuitorImage])
    }
     
    func setupConstraints() {
        contribuitorImage.cBuild { (make) in
            make.width.equal(to: 30)
            make.height.equal(to: 30)
            make.top.equal(to: topAnchor, offsetBy: 10)
            make.leading.equal(to: leadingAnchor, offsetBy: 10)
            make.trailing.equal(to: trailingAnchor, offsetBy: -10)
            make.bottom.equal(to: bottomAnchor, offsetBy: -10)
        }
    }
}
