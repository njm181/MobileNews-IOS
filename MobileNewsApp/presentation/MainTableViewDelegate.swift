//
//  MainTableViewDelegate.swift
//  MobileNewsApp
//
//  Created by Nico Molina on 17/02/2024.
//

import Foundation
import UIKit

final class MainTableViewDelegate: NSObject, UITableViewDelegate {
    
    private var viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = viewModel.resultNewsArticlesList[indexPath.row]
        print("CELL ==>> \(model)")
    }
    
}
