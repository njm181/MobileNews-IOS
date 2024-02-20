//
//  MainLargeCollectionViewDataSource.swift
//  MobileNewsApp
//
//  Created by Nico Molina on 19/02/2024.
//

import Foundation
import UIKit

class NewsLargeCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    private var dataSource: [Article] = []
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LargeCollectionViewCell", for: indexPath) as! LargeCollectionViewCell
        cell.configure(model: dataSource[indexPath.item])
        return cell
    }
    
    func updateDataSource(data: [Article]) {
        self.dataSource = data
    }
}

