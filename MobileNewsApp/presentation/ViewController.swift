//  ViewController.swift
//  MobileNewsApp
//
//  Created by Nico Molina on 08/02/2024.


import UIKit
import Combine

class ViewController: UIViewController {
    
    let data = ["Title 1", "Title 2", "Title 3", "Title 4", "Title 5"]

    private var dataSource: MainCollectionViewDataSource?
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
        layout.minimumLineSpacing = 16
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 16)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .brown
        collection.showsHorizontalScrollIndicator = false
        collection.register(SmallCollectionViewCell.self, forCellWithReuseIdentifier: "SmallCollectionViewCell")
        return collection
    }()
    
    var verticalCollectionView: UICollectionView = {
        let configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        var layout = UICollectionViewCompositionalLayout.list(using: configuration)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .green
        collection.register(SmallCollectionViewCell.self, forCellWithReuseIdentifier: "SmallCollectionViewCell")
        return collection
    }()
    
//    var progressView: UIActivityIndicatorView = {
//        var progress = UIActivityIndicatorView(style: .large)
//        progress.translatesAutoresizingMaskIntoConstraints = false
//        return progress
//    }()
//

//    override func loadView() {
//        self.dataSource = MainTableViewDataSource(dataSource: resultNews)
//        self.delegate = MainTableViewDelegate(viewModel: viewModel)
//        tableView.dataSource = dataSource
//        tableView.delegate = delegate
//        tableView.register(SmallCell.self, forCellReuseIdentifier: "SmallCell")
//    }
    
    override func viewDidLoad() {
        view.addSubview(horizontalCollectionView)
        view.addSubview(verticalCollectionView)
        //self.dataSource = MainCollectionViewDataSource()
        self.dataSource = MainCollectionViewDataSource()
        //self.delegate = MainCollectionViewDelegate(viewModel: viewModel)
        horizontalCollectionView.dataSource = dataSource
        //collectionView.delegate = delegate
        NSLayoutConstraint.activate([
            horizontalCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            horizontalCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            horizontalCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            horizontalCollectionView.heightAnchor.constraint(equalToConstant: 200),
        ])
        
        NSLayoutConstraint.activate([
            verticalCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            verticalCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            verticalCollectionView.topAnchor.constraint(equalTo: horizontalCollectionView.bottomAnchor, constant: 16),
            verticalCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)

        ])
        
       
        
        //view.addSubview(progressView)
//        NSLayoutConstraint.activate([
//           progressView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//           progressView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
//       ])
        
//        viewModel.$isLoading
//            .receive(on: DispatchQueue.main)
//            .sink { [weak self] loading in
//                if loading == true{
//                    self?.progressView.isHidden = false
//                    self?.progressView.startAnimating()
//                } else {
//                    self?.progressView.isHidden = true
//                    self?.progressView.stopAnimating()
//                }
//            }
//            .store(in: &cancellables)
        
        
        Task {
            await viewModel.getAllNews()
        }
        getTheGuardian()
        //getNewYorkTimes()
        //getNews()
    }
    
    
    private func getTheGuardian(){
        viewModel.$resultTheGuardianArticlesList
            .receive(on: DispatchQueue.main)
            .sink { [weak self] theGuardian in
                self?.resultTheGuardian = theGuardian
                self?.dataSource?.updateDataSource(data: theGuardian)
                self?.horizontalCollectionView.reloadData()
                //print("FROM CONTROLLER 1==> \(String(describing: self?.resultTheGuardian.first?.sectionName))")
                print("FROM CONTROLLER 1==> \(String(describing: theGuardian.count))")
            }
            .store(in: &cancellables)
    }
//    private func getNewYorkTimes(){
//        viewModel.$resultNewYorkTimesArticlesList
//            .receive(on: DispatchQueue.main)
//            .sink { [weak self] newYorkTimes in
//                self?.resultNewYorkTimes = newYorkTimes
//                
//                print("FROM CONTROLLER 2==> \(String(describing: self?.resultNewYorkTimes.first))")
//            }
//            .store(in: &cancellables)
//    }
//    private func getNews(){
//        viewModel.$resultNewsArticlesList
//            .receive(on: DispatchQueue.main)
//            .sink { [weak self] news in
//                self?.resultNews = news
//                self?.tableView.reloadData()
//                print("FROM CONTROLLER 3==> \(String(describing: self?.resultNews.first))")
//            }
//            .store(in: &cancellables)
//    }

}
