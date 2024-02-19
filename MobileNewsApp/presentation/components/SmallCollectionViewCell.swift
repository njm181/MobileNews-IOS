//
//  SmallCell.swift
//  MobileNewsApp
//
//  Created by Nico Molina on 17/02/2024.
//

import UIKit

class SmallCollectionViewCell: UICollectionViewCell {
    
    private lazy var smallTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textAlignment = .left
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Section Name"
        label.backgroundColor = .red
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        addSubview(smallTitleLabel)
        
        NSLayoutConstraint.activate([
            smallTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            smallTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

    func configure(model: ResultTheGuardian) {
    //func configure(model: String) {
        smallTitleLabel.text = model.sectionName
    }
}
