//
//  InsideRepoContentView.swift
//  Stalki
//
//  Created by Vinicius Mangueira on 22/10/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class InsideRepoContentView: UIView, ConfigurableView {
   
    
    let contents = ["","OWNER", "CONTRIBUTORS","SOURCE", "ISSUES", "PULL REQUESTS"]
    
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
        RepoTableFactory.registerCells(cells: [OwnerCell.self], on: self.tableView)
    }
}

extension InsideRepoContentView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return InsideRepoHeaderView()
        } else {
            return SectionHeaderView(textLabel: contents[section])
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 250
        } else {
            return 50
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 0
        } else {
            return 1
        }
    }
      
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: OwnerCell.self)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
