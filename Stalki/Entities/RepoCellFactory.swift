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
    
    func disposeHeader(withSection section: Int) -> (headerView: UIView, heightForHeader: CGFloat) {
        switch section {
        case 0:
            return (InsideRepoHeaderView(), 250)
        default:
            return (SectionHeaderView(textLabel: items[section]), 50)
        }
    }
    
    func numberOfSections() -> Int { return items.count }
    
    func disposeRows(withIndexPath indexPath: IndexPath) -> (numberOfRows: Int, heightForRow: CGFloat) {
        if indexPath.section == 0 {
                   return (0,0)
        } else if indexPath.section == 2{
                   return (1, 50)
        } else{
            return (1, 100)
        }
    }
    
    func cellForRow(on tableView: UITableView,forIndexPath indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 1 {
                  return tableView.dequeueReusableCell(for: indexPath, cellType: OwnerCell.self)
        } else if indexPath.section == 2 {
                  return tableView.dequeueReusableCell(for: indexPath, cellType: ContributorsCell.self)
        }
        
        return UITableViewCell()
    }
}
