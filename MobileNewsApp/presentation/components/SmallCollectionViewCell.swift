//
//  SmallCell.swift
//  MobileNewsApp
//
//  Created by Nico Molina on 17/02/2024.
//

import UIKit

class SmallCollectionViewCell: UICollectionViewCell {
    private lazy var webUrl: String = ""
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 5
        view.heightAnchor.constraint(equalToConstant: 40).isActive = true
        view.widthAnchor.constraint(equalToConstant: 80).isActive = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(containerViewTapped))
        view.addGestureRecognizer(tapGesture)
        return view
    }()
    
    private lazy var smallTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.textAlignment = .left
        label.textColor = .black
        label.text = "Section Name"
        return label
    }()
    
    private lazy var smallDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.textAlignment = .left
        label.textColor = .black
        label.text = "Description"
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
        containerView.addSubview(smallTitleLabel)
        containerView.addSubview(smallDescriptionLabel)
        
        addSubview(containerView)
        
        NSLayoutConstraint.activate([
            
            smallTitleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 5),
            smallTitleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            smallTitleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            
            smallDescriptionLabel.topAnchor.constraint(equalTo: smallTitleLabel.bottomAnchor, constant: 5),
            smallDescriptionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            smallDescriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            smallDescriptionLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -5)
        ])
    }

    func configure(model: ResultTheGuardian) {
        smallTitleLabel.text = model.sectionName
        smallDescriptionLabel.text = model.webTitle
        webUrl = model.webUrl
    }
    
    @objc private func containerViewTapped() {
        if let url = URL(string: webUrl) {
            UIApplication.shared.open(url)
        }
    }
}
