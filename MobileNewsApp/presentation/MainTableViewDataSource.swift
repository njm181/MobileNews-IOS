//
//  MainTableViewDelegate.swift
//  MobileNewsApp
//
//  Created by Nico Molina on 17/02/2024.
//

import Foundation
import UIKit

final class MainTableViewDataSource: NSObject, UITableViewDataSource {
    
    private let dataSource: [Article]
    
    init(dataSource: [Article]) {
        self.dataSource = dataSource
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        dataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SmallCell", for: indexPath) as! SmallCell
        
        let model = dataSource[indexPath.row]
        
        cell.configure(model: model)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Api News"
    }
}
