//
//  InsideRepoHeaderView.swift
//  Stalki
//
//  Created by Vinicius Mangueira on 22/10/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class InsideRepoHeaderView: UIView, ConfigurableView {
   
    let headerRepoImage = UIImageView().then{
        $0.image = #imageLiteral(resourceName: "Screen Shot 2019-10-22 at 15.37.54")
        $0.contentMode = .scaleAspectFit
        $0.cBuild(width: 50)
        $0.cBuild(height: 50)
    }
    
    let nameRepo = UILabel().then {
        $0.text = "Vagas"
        $0.numberOfLines = 0
        $0.lineBreakMode = .byWordWrapping
        $0.textColor = .titleColor
        $0.font = .boldSystemFont(ofSize: 18)
    }
    
    let descriptionRepo = UILabel().then {
        $0.text = "🔬 Espaço para divulgação de vagas para front-enders."
        $0.numberOfLines = 0
        $0.lineBreakMode = .byWordWrapping
        $0.textColor = .titleColor
        $0.font = .italicSystemFont(ofSize: 14)
    }

    let starsCount = UILabel().with(\.text, setValueToProperty: "3.6K").with(\.textColor, setValueToProperty: .white).with(\.font, setValueToProperty: .boldSystemFont(ofSize: 16))
    
    let starsInfo = UILabel().with(\.text, setValueToProperty: "Stars").with(\.textColor, setValueToProperty: .white).with(\.font, setValueToProperty: .boldSystemFont(ofSize: 12))
    
    let watchersCount = UILabel().with(\.text, setValueToProperty: "1.2K").with(\.textColor, setValueToProperty: .white).with(\.font, setValueToProperty: .boldSystemFont(ofSize: 16))
     
     let watchersInfo = UILabel().with(\.text, setValueToProperty: "Watchers").with(\.textColor, setValueToProperty: .white).with(\.font, setValueToProperty: .boldSystemFont(ofSize: 12))
    
    let forksCount = UILabel().with(\.text, setValueToProperty: "391").with(\.textColor, setValueToProperty: .white).with(\.font, setValueToProperty: .boldSystemFont(ofSize: 16))
    
    let forksInfo = UILabel().with(\.text, setValueToProperty: "Forks").with(\.textColor, setValueToProperty: .white).with(\.font, setValueToProperty: .boldSystemFont(ofSize: 12))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        backgroundColor = .gitColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        addSubviews([headerRepoImage, nameRepo, descriptionRepo, starsCount, starsInfo, watchersCount, watchersInfo, forksCount, forksInfo])
    }
       
    func setupConstraints() {
        headerRepoImage.cBuild { (make) in
            make.top.equal(to: topAnchor, offsetBy: 20)
        }
        
        headerRepoImage.cBuild(make: .centerXInSuperView)
        
        
        nameRepo.cBuild { (make) in
            make.top.equal(to: headerRepoImage.bottomAnchor, offsetBy: 20)
            make.centerX.equal(to: headerRepoImage.centerXAnchor, offsetBy: 0)
        }
        
        descriptionRepo.cBuild { (make) in
            make.top.equal(to: nameRepo.bottomAnchor, offsetBy: 5)
            make.leading.equal(to: leadingAnchor, offsetBy: 30)
            make.trailing.equal(to: trailingAnchor, offsetBy: -5)
        }
        
        starsCount.cBuild { (make) in
            make.top.equal(to: descriptionRepo.bottomAnchor, offsetBy: 50)
            make.leading.equal(to: leadingAnchor, offsetBy: 10)
        }
        
        starsInfo.cBuild { (make) in
            make.bottom.equal(to: starsCount.bottomAnchor, offsetBy: 10)
            make.centerX.equal(to: starsCount.centerXAnchor, offsetBy: 0)
        }
        
        watchersCount.cBuild { (make) in
                 make.top.equal(to: starsCount.topAnchor)
                 make.centerX.equal(to: centerXAnchor)
             }
             
        watchersInfo.cBuild { (make) in
            make.top.equal(to: starsInfo.topAnchor)
            make.centerX.equal(to: watchersCount.centerXAnchor)
             }
        
        forksCount.cBuild { (make) in
                        make.top.equal(to: starsCount.topAnchor)
                        make.trailing.equal(to: trailingAnchor, offsetBy: -20)
                    }
                    
        forksInfo.cBuild { (make) in
            make.top.equal(to: starsInfo.topAnchor)
            make.centerX.equal(to: forksCount.centerXAnchor)
        }
    }
}
