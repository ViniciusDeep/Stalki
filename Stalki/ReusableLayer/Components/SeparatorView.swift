//
//  SeparatorView.swift
//  Stalki
//
//  Created by Vinicius Mangueira on 10/11/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class SeparatorView: UIView {
    
    convenience init(withSizeLine size: CGFloat) {
        self.init()
        self.cBuild { (make) in
            make.height.equal(to: size)
        }
        self.backgroundColor = .lightGray
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
