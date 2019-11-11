//
//  SectionsHeader.swift
//  Stalki
//
//  Created by Vinicius Mangueira on 10/11/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class SectionHeaderView: UIView, ConfigurableView {

    let titleLabel = UILabel().with(\.font, setValueToProperty: .boldSystemFont(ofSize: 16))
    
    
    convenience init(textLabel: String) {
        self.init()
        titleLabel.text = textLabel
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        self.backgroundColor = .backgroundColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        addSubviews([titleLabel])
    }
    
    func setupConstraints() {
        titleLabel.cBuild { (make) in
            make.top.equal(to: topAnchor, offsetBy: 10)
            make.leading.equal(to: leadingAnchor, offsetBy: 10)
        }
    }
}
