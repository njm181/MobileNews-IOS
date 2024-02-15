//
//  ViewController.swift
//  MobileNewsApp
//
//  Created by Nico Molina on 08/02/2024.
//

import UIKit

class ViewController: UIViewController {
    
    private var viewModel: ViewModel = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        
        Task {
            await viewModel.executeApi()
        }
    }


}

