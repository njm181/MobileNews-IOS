//
//  MainScreen.swift
//  MobileNewsApp
//
//  Created by Nico Molina on 16/02/2024.
//

import Foundation
import UIKit

final class MainScreen: UIView {
    
    private let largeCard = LargeCard()
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            setupView()
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            setupView()
        }
        
        private func setupView() {
            backgroundColor = .yellow // Cambia el color de fondo según tus necesidades
            
            addSubview(largeCard)
            largeCard.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                largeCard.centerXAnchor.constraint(equalTo: centerXAnchor),
                largeCard.centerYAnchor.constraint(equalTo: centerYAnchor)
            ])
        }
}
