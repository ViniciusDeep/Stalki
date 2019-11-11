//
//  OwnerCell.swift
//  Stalki
//
//  Created by Vinicius Mangueira on 10/11/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Reusable

class OwnerCell: UITableViewCell, ConfigurableView {
  
    let imageOwner = RoundImage(frame: .zero).with(\.image, setValueToProperty: UIImage(named: "devxoul"))
    
    let nameOwner = UILabel().with(\.text, setValueToProperty: "DevXoul")
    
    let separatorUpLine = SeparatorView(withSizeLine: 1)
    
    let separatorBellowLine = SeparatorView(withSizeLine: 1)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        self.backgroundColor = .backgroundColor
        self.accessoryType = .disclosureIndicator
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
          addSubviews([imageOwner, nameOwner, separatorUpLine, separatorBellowLine])
    }
      
    func setupConstraints() {
        
        separatorUpLine.cBuild { (make) in
            make.top.equal(to: topAnchor, offsetBy: 2)
            make.leading.equal(to: leadingAnchor, offsetBy: 0)
            make.trailing.equal(to: trailingAnchor, offsetBy: 0)
        }
        
        
        imageOwner.cBuild { (make) in
            make.leading.equal(to: leadingAnchor, offsetBy: 10)
            make.width.equal(to: 65)
            make.height.equal(to: 65)
            make.centerY.equal(to: centerYAnchor)
        }
        
        nameOwner.cBuild { (make) in
            make.leading.equal(to: imageOwner.trailingAnchor, offsetBy: 10)
            make.centerY.equal(to: centerYAnchor)
        }
        
        separatorBellowLine.cBuild { (make) in
                   make.bottom.equal(to: bottomAnchor, offsetBy: -2)
                   make.leading.equal(to: leadingAnchor, offsetBy: 0)
                   make.trailing.equal(to: trailingAnchor, offsetBy: 0)
               }
    }
    
    override func layoutSubviews() {
        setupView()
    }
}
