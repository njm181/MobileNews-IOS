//
//  MainTableViewDelegate.swift
//  MobileNewsApp
//
//  Created by Nico Molina on 17/02/2024.
//

import Foundation
import UIKit

class MainCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    private var dataSource: [ResultTheGuardian] = []
//    private var dataSource: [String] = []
//    
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return dataSource.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SmallCollectionViewCell", for: indexPath) as! SmallCollectionViewCell
//        
//        let model = dataSource[indexPath.row]
//        
//        cell.configure(model: model)
//        
//        return cell
//    }
    
//    private var dataSource: [String] = []
//    
//    init(dataSource: [String]) {
//        self.dataSource = dataSource
//    }
//    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SmallCollectionViewCell", for: indexPath) as! SmallCollectionViewCell
        cell.configure(model: dataSource[indexPath.item])
        return cell
    }
    
    func updateDataSource(data: [ResultTheGuardian]) {
    //func updateDataSource(with data: [String]) {
        self.dataSource = data
    }
}
