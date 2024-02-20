//
//  LargeCard.swift
//  MobileNewsApp
//
//  Created by Nico Molina on 16/02/2024.
//

import Foundation
import UIKit

final class LargeCollectionViewCell: UICollectionViewCell {
    
    private lazy var webUrl: String = ""
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 5
        view.heightAnchor.constraint(equalToConstant: 230).isActive = true
        view.widthAnchor.constraint(equalToConstant: 290).isActive = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(containerViewTapped))
        view.addGestureRecognizer(tapGesture)
        return view
    }()
    
    let imageNews: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.backgroundColor = .black
        return iv
    }()
    
    
    private lazy var largeTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.textAlignment = .left
        label.textAlignment = .center
        label.textColor = .black
        label.text = "Section Name"
        return label
    }()
    
    private lazy var largeDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.textAlignment = .left
        label.numberOfLines = 3
        label.textColor = .black
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
        containerView.addSubview(largeTitleLabel)
        containerView.addSubview(largeDescriptionLabel)
        containerView.addSubview(imageNews)
        
        addSubview(containerView)
        
        NSLayoutConstraint.activate([
            
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 16),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            largeTitleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 5),
            largeTitleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            largeTitleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            
            imageNews.topAnchor.constraint(equalTo: largeTitleLabel.bottomAnchor, constant: 5),
            imageNews.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            imageNews.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            imageNews.heightAnchor.constraint(equalToConstant: 150), // Altura fija de 60 puntos
            
            largeDescriptionLabel.topAnchor.constraint(equalTo: imageNews.bottomAnchor, constant: 5),
            largeDescriptionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            largeDescriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
        ])
    }
    
    @objc private func containerViewTapped() {
        if let url = URL(string: webUrl) {
            UIApplication.shared.open(url)
        }
    }

    func configure(model: Any) {
    
        switch model {
        case let article as Article:
            largeTitleLabel.text = article.title
            largeDescriptionLabel.text = article.description
            loadImageFromURL(url: URL(string: article.urlToImage ?? "")!)
            webUrl = article.url
        case let result as ResultNewYorkTimes:
            largeTitleLabel.text = result.title
            largeDescriptionLabel.text = result.abstract
            loadImageFromURL(url: URL(string: result.multimedia.first?.url ?? "")!)
            webUrl = result.url
        default:
            largeTitleLabel.text = "Tipo no reconocido"
        }
    }
    
    func loadImageFromURL(url: URL) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                DispatchQueue.main.async {
                    if let image = UIImage(data: data) {
                        self.imageNews.image = image
                    }
                }
            }
        }.resume()
    }
}
