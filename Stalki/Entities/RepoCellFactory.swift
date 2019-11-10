//
//  RepoCellFactory.swift
//  Stalki
//
//  Created by Vinicius Mangueira on 10/11/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Reusable

protocol CellBuidable {
    static func registerCell(on tableView: UITableView)
    func cellFromTableView(_ tableView: UITableView, forIndexPath indexPath: IndexPath)
    func didSelectCell()
}

extension UITableViewCell: Reusable{}

struct RepoTableFactory {
    
    let items = ["","OWNER", "CONTRIBUTORS","SOURCE", "ISSUES", "PULL REQUESTS"]
    
    
    static func registerCells(cells: [UITableViewCell.Type], on tableView: UITableView) {
        cells.forEach { (cell) in
            tableView.register(cellType: cell)
        }
    }
    
    
    
    
    
}
