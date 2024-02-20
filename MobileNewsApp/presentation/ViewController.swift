//  ViewController.swift
//  MobileNewsApp
//
//  Created by Nico Molina on 08/02/2024.


import UIKit
import Combine

class ViewController: UIViewController {
    

    private var smallDataSource: MainSmallCollectionViewDataSource?
    private var newsLargeDataSource: NewsLargeCollectionViewDataSource?
    private var newYorkTimesLargeDataSource: NewYorkTimesLargeCollectionViewDataSource?
    private var delegate: MainCollectionViewDelegate?
    private var viewModel: ViewModel = ViewModel()
    private var cancellables = Set<AnyCancellable>()

    private var articles: [Article] = []
    private var articlesBIS: [Article] = []
    
    private var resultNews: [Article] = []
    private var resultNewYorkTimes: [ResultNewYorkTimes] = []
    private var resultTheGuardian: [ResultTheGuardian] = []

    var horizontalCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 40
        layout.minimumLineSpacing = 40
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.showsHorizontalScrollIndicator = false
        collection.register(SmallCollectionViewCell.self, forCellWithReuseIdentifier: "SmallCollectionViewCell")
        return collection
    }()
    
    var newsVerticalCollectionView: UICollectionView = {
        let configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        var layout = UICollectionViewCompositionalLayout.list(using: configuration)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(LargeCollectionViewCell.self, forCellWithReuseIdentifier: "LargeCollectionViewCell")
        return collection
    }()
    
    var newYorkTimesVerticalCollectionView: UICollectionView = {
        let configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        var layout = UICollectionViewCompositionalLayout.list(using: configuration)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(LargeCollectionViewCell.self, forCellWithReuseIdentifier: "LargeCollectionViewCell")
        return collection
    }()
    
    var progressView: UIActivityIndicatorView = {
        var progress = UIActivityIndicatorView(style: .large)
        progress.translatesAutoresizingMaskIntoConstraints = false
        return progress
    }()

    
    override func viewDidLoad() {
        let remainingHeight = (view.frame.height - 200 - 16 * 2) / 2
        view.addSubview(horizontalCollectionView)
        view.addSubview(newsVerticalCollectionView)
        view.addSubview(newYorkTimesVerticalCollectionView)
        view.addSubview(progressView)


        self.smallDataSource = MainSmallCollectionViewDataSource()
        self.newsLargeDataSource = NewsLargeCollectionViewDataSource()
        self.newYorkTimesLargeDataSource = NewYorkTimesLargeCollectionViewDataSource()

        horizontalCollectionView.dataSource = smallDataSource
        newsVerticalCollectionView.dataSource = newsLargeDataSource
        newYorkTimesVerticalCollectionView.dataSource = newYorkTimesLargeDataSource

        NSLayoutConstraint.activate([
            horizontalCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            horizontalCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            horizontalCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            horizontalCollectionView.heightAnchor.constraint(equalToConstant: 200),
        ])

        NSLayoutConstraint.activate([
            newsVerticalCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            newsVerticalCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            newsVerticalCollectionView.topAnchor.constraint(equalTo: horizontalCollectionView.bottomAnchor, constant: 16),
            newsVerticalCollectionView.heightAnchor.constraint(equalToConstant: remainingHeight)
        ])

        NSLayoutConstraint.activate([
            newYorkTimesVerticalCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            newYorkTimesVerticalCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            newYorkTimesVerticalCollectionView.topAnchor.constraint(equalTo: newsVerticalCollectionView.bottomAnchor, constant: 16),
            newYorkTimesVerticalCollectionView.heightAnchor.constraint(equalToConstant: remainingHeight)
        ])
       
        
        NSLayoutConstraint.activate([
           progressView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
           progressView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
       ])
        
        viewModel.$isLoading
            .receive(on: DispatchQueue.main)
            .sink { [weak self] loading in
                if loading == true{
                    self?.progressView.isHidden = false
                    self?.progressView.startAnimating()
                } else {
                    self?.progressView.isHidden = true
                    self?.progressView.stopAnimating()
                }
            }
            .store(in: &cancellables)
        
        
        Task {
            await viewModel.getAllNews()
        }
        getTheGuardian()
        getNewYorkTimes()
        getNews()
    }
    
    
    private func getTheGuardian(){
        viewModel.$resultTheGuardianArticlesList
            .receive(on: DispatchQueue.main)
            .sink { [weak self] theGuardian in
                self?.smallDataSource?.updateDataSource(data: theGuardian)
                self?.horizontalCollectionView.reloadData()
            }
            .store(in: &cancellables)
    }
    
    private func getNewYorkTimes(){
        viewModel.$resultNewYorkTimesArticlesList
            .receive(on: DispatchQueue.main)
            .sink { [weak self] newYorkTimes in
                self?.newYorkTimesLargeDataSource?.updateDataSource(data: newYorkTimes)
                self?.newYorkTimesVerticalCollectionView.reloadData()
            }
            .store(in: &cancellables)
    }
    
    private func getNews(){
        viewModel.$resultNewsArticlesList
            .receive(on: DispatchQueue.main)
            .sink { [weak self] news in
                self?.newsLargeDataSource?.updateDataSource(data: news)
                self?.newsVerticalCollectionView.reloadData()
            }
            .store(in: &cancellables)
    }

}
