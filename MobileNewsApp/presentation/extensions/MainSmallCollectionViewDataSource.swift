//
//  MainTableViewDelegate.swift
//  MobileNewsApp
//
//  Created by Nico Molina on 17/02/2024.
//

import Foundation
import UIKit

class MainSmallCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    private var dataSource: [ResultTheGuardian] = []
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SmallCollectionViewCell", for: indexPath) as! SmallCollectionViewCell
        cell.configure(model: dataSource[indexPath.item])
        return cell
    }
    
    func updateDataSource(data: [ResultTheGuardian]) {
        self.dataSource = data
    }
}
