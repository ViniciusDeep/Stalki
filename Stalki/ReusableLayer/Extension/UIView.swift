//
//  UIView.swift
//  Stalki
//
//  Created by Vinicius Mangueira on 08/11/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

protocol With{}

extension With where Self : AnyObject {
    // Fluent Interface
    @discardableResult
    func with<T>(_ property: ReferenceWritableKeyPath<Self, T>, setValueToProperty value: T) -> Self {
        self[keyPath: property] = value
        return self
    }
}

extension UIView: With{}
