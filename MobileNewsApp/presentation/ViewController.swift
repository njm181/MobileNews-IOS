//
//  ViewController.swift
//  MobileNewsApp
//
//  Created by Nico Molina on 08/02/2024.
//

import UIKit
import Combine

class ViewController: UIViewController {
    
    private lazy var smallCardContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .brown
        
        view.widthAnchor.constraint(equalToConstant: 130).isActive = true
        view.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        return view
    }()
    
    private lazy var smallTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textAlignment = .left
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Section Name"
        
        return label
    }()
    
    private lazy var smallDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description"
        label.numberOfLines = 2
        return label
    }()
    
    //=============
    
    private lazy var largeCardContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .brown
        
        view.widthAnchor.constraint(equalToConstant: 250).isActive = true
        view.heightAnchor.constraint(equalToConstant: 260).isActive = true
        
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .center
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Section Name"
        
        return label
    }()
    
    private lazy var imageNews: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.heightAnchor.constraint(equalToConstant: 150).isActive = true
        iv.backgroundColor = .black
        
        return iv
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description"
        label.numberOfLines = 2
        return label
    }()
    
    
    
    private var viewModel: ViewModel = ViewModel()
    private var cancellables = Set<AnyCancellable>()
    private var largeCard = LargeCard()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        //view.addSubview(stackView)
        
        configureUI()
//        viewModel.$newsArticleList
//            .receive(on: DispatchQueue.main)
//            .sink { [weak self] articleList in
//                print("FROM CONTROLLER ==> \(articleList)")
//            }
//            .store(in: &cancellables)
//        
//        Task {
//            await viewModel.getNews()
//        }
    }

    private func configureUI() {
        view.backgroundColor = .white
        
        view.addSubview(largeCardContainer)
        largeCardContainer.addSubview(titleLabel)
        largeCardContainer.addSubview(imageNews)
        largeCardContainer.addSubview(descriptionLabel)

        NSLayoutConstraint.activate([
            largeCardContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            largeCardContainer.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: largeCardContainer.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: largeCardContainer.topAnchor, constant: 16)
        ])
        
                
        NSLayoutConstraint.activate([
            imageNews.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageNews.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            imageNews.leadingAnchor.constraint(equalTo: largeCardContainer.leadingAnchor, constant: 16),
            imageNews.trailingAnchor.constraint(equalTo: largeCardContainer.trailingAnchor, constant: -16),
            
        ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: imageNews.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: largeCardContainer.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: largeCardContainer.trailingAnchor, constant: -16),
            
        ])
        //======
        
        view.addSubview(smallCardContainer)
        smallCardContainer.addSubview(smallTitleLabel)
        smallCardContainer.addSubview(smallDescriptionLabel)
        
        NSLayoutConstraint.activate([
            smallCardContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            smallCardContainer.topAnchor.constraint(equalTo: largeCardContainer.bottomAnchor, constant: 48)
        ])
        
        NSLayoutConstraint.activate([
            //smallTitleLabel.centerXAnchor.constraint(equalTo: smallCardContainer.centerXAnchor),
            smallTitleLabel.topAnchor.constraint(equalTo: smallCardContainer.topAnchor, constant: 8),
            smallTitleLabel.leadingAnchor.constraint(equalTo: smallCardContainer.leadingAnchor, constant: 8),
            smallTitleLabel.trailingAnchor.constraint(equalTo: smallCardContainer.trailingAnchor, constant: -8),
        ])
        
        NSLayoutConstraint.activate([
            //smallDescriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            smallDescriptionLabel.topAnchor.constraint(equalTo: smallTitleLabel.bottomAnchor, constant: 8),
            smallDescriptionLabel.leadingAnchor.constraint(equalTo: smallCardContainer.leadingAnchor, constant: 8),
            smallDescriptionLabel.trailingAnchor.constraint(equalTo: smallCardContainer.trailingAnchor, constant: -8),
        ])

    }

}

