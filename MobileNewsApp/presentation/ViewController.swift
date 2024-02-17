//
//  ViewController.swift
//  MobileNewsApp
//
//  Created by Nico Molina on 08/02/2024.
//

import UIKit
import Combine

class ViewController: UIViewController {
    
    let tableView = UITableView()
    private var dataSource: MainTableViewDataSource?
    private var delegate: MainTableViewDelegate?
    
    private var viewModel: ViewModel = ViewModel()
    private var cancellables = Set<AnyCancellable>()

    private var articles: [Article] = []
    private var articlesBIS: [Article] = []
    
    private var resultNews: [Article] = []
    private var resultNewYorkTimes: [ResultNewYorkTimes] = []
    private var resultTheGuardian: [ResultTheGuardian] = []
    
    
    // Configurar la barra de progreso
    var progressView: UIActivityIndicatorView = {
        var progress = UIActivityIndicatorView(style: .large)
        progress.translatesAutoresizingMaskIntoConstraints = false
        return progress
    }()
            

    override func loadView() {
        self.dataSource = MainTableViewDataSource(dataSource: resultNews)
        self.delegate = MainTableViewDelegate(viewModel: viewModel)
        tableView.dataSource = dataSource
        tableView.delegate = delegate
        tableView.register(SmallCell.self, forCellReuseIdentifier: "SmallCell")
        view = tableView
    }
    
    override func viewDidLoad() {
        view.addSubview(progressView)
        NSLayoutConstraint.activate([
           progressView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
           progressView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
       ])
        
        // Iniciar el temporizador para ocultar la barra de progreso después de 3 segundos
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
            await viewModel.getNews()
        }
        getTheGuardian()
        getNewYorkTimes()
        getNews()
    }
    
    
    private func getTheGuardian(){
        viewModel.$resultTheGuardianArticlesList
            .receive(on: DispatchQueue.main)
            .sink { [weak self] theGuardian in
                self?.resultTheGuardian = theGuardian
                
                print("FROM CONTROLLER 1==> \(String(describing: self?.resultTheGuardian.first))")
            }
            .store(in: &cancellables)
    }
    private func getNewYorkTimes(){
        viewModel.$resultNewYorkTimesArticlesList
            .receive(on: DispatchQueue.main)
            .sink { [weak self] newYorkTimes in
                self?.resultNewYorkTimes = newYorkTimes
                
                print("FROM CONTROLLER 2==> \(String(describing: self?.resultNewYorkTimes.first))")
            }
            .store(in: &cancellables)
    }
    private func getNews(){
        viewModel.$resultNewsArticlesList
            .receive(on: DispatchQueue.main)
            .sink { [weak self] news in
                self?.resultNews = news
                
                print("FROM CONTROLLER 3==> \(String(describing: self?.resultNews.first))")
            }
            .store(in: &cancellables)
    }

}
