//
//  InsideUserHeader.swift
//  Stalki
//
//  Created by Vinicius Mangueira on 20/10/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import SDWebImage

class InsideUserHeader: UIView, ConfigurableView {
  
    var viewModel: InsideUserViewModel! {
        didSet {
            profileImage.sd_setImage(with: URL(string: viewModel.user!.imageUrl)!)
            userName.text = viewModel.user?.userName
        }
    }
    
    
    let profileImage = UIImageView().then{
        $0.contentMode = .scaleAspectFit
        $0.layer.cornerRadius = 8
        $0.layer.masksToBounds = true
        $0.layer.borderWidth = 2
        $0.layer.borderColor = UIColor.white.cgColor
    }
    
    let userName = UILabel().then{
        $0.lineBreakMode = .byWordWrapping
        $0.font = UIFont.boldSystemFont(ofSize: 16)
        $0.textColor = .titleColor
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        self.backgroundColor = .gitColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
          addSubviews([profileImage, userName])
      }
      
      func setupConstraints() {
        profileImage.cBuild { (make) in
            make.top.equal(to: topAnchor, offsetBy: 10)
        }
        
        profileImage.cBuild(make: .centerXInSuperView)
        
        profileImage.cBuild(width: 100)
        profileImage.cBuild(height: 100)
        
        userName.cBuild { (make) in
            make.top.equal(to: profileImage.bottomAnchor, offsetBy: 5)
            make.centerX.equal(to: profileImage.centerXAnchor)
        }
      }
}
