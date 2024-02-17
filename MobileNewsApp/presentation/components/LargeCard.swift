//
//  LargeCard.swift
//  MobileNewsApp
//
//  Created by Nico Molina on 16/02/2024.
//

import Foundation
import UIKit

final class LargeCard: UIView {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .center
        label.text = "Section Name"
        
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .green
        stackView.axis = .vertical
        stackView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        addSubview(stackView)
        
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        addSubview(stackView)
//        NSLayoutConstraint.activate([
//            stackView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
//            stackView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
////            stackView.widthAnchor.constraint(equalToConstant: 250),
////            stackView.heightAnchor.constraint(equalToConstant: 260)
//        ])

        
    }
}
