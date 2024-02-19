//
//  LargeCard.swift
//  MobileNewsApp
//
//  Created by Nico Molina on 16/02/2024.
//

import Foundation
import UIKit

final class LargeCard: UITableViewCell {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .center
        label.text = "Section Name"
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            //constraints for image
//            smallTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
//            smallTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
//            smallTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func configure(model: Article) {
        titleLabel.text = model.title
    }
}
