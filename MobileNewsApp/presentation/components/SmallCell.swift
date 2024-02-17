//
//  SmallCell.swift
//  MobileNewsApp
//
//  Created by Nico Molina on 17/02/2024.
//

import UIKit

class SmallCell: UITableViewCell {
    
    private lazy var smallTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textAlignment = .left
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Section Name"

        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(smallTitleLabel)
        
        NSLayoutConstraint.activate([
            //constraints for image
//            smallTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
//            smallTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
//            smallTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            
            smallTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            smallTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(model: Article) {
        smallTitleLabel.text = model.title
    }
}
