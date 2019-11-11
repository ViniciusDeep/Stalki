//
//  InsideRepoContentView.swift
//  Stalki
//
//  Created by Vinicius Mangueira on 22/10/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class InsideRepoContentView: UIView, ConfigurableView {
   
    let factory = RepoTableFactory()
    
    lazy var tableView = UITableView(frame: .zero, style: .grouped).then {
        $0.separatorStyle = .none
        $0.backgroundColor = .backgroundColor
        $0.delegate = self
        $0.dataSource = self
    }
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        registerCellsAtTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        addSubviews([tableView])
    }
       
    func setupConstraints() {
        tableView.cBuild(make: .fillSuperview)
    }
    
    fileprivate func registerCellsAtTableView() {
        RepoTableFactory.registerCells(cells: [OwnerCell.self, ContributorsCell.self], on: tableView)
    }
}

extension InsideRepoContentView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return factory.disposeHeader(withSection: section).headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return factory.disposeHeader(withSection: section).heightForHeader
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return factory.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return factory.disposeRows(withIndexPath: IndexPath(row: 0, section: section)).numberOfRows
    }
      
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return factory.cellForRow(on: tableView, forIndexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return factory.disposeRows(withIndexPath: indexPath).heightForRow
    }
}
