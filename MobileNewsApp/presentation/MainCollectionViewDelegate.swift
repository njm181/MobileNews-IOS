//
//  MainTableViewDelegate.swift
//  MobileNewsApp
//
//  Created by Nico Molina on 17/02/2024.
//

import Foundation
import UIKit

final class MainCollectionViewDelegate: NSObject, UICollectionViewDelegate {
    
    private var viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model = viewModel.resultNewsArticlesList[indexPath.item]
        //click
        print("CELL ==>> \(model)")
    }
}
