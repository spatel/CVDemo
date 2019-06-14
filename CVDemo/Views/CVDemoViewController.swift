//
//  CVDemoViewController.swift
//  CVDemo
//
//  Created by Shilan Patel on 14/06/2019.
//  Copyright © 2019 Shilan Patel. All rights reserved.
//

import UIKit

class CVDemoViewController: UITableViewController {
    
    private let dataSource = CVDemoViewDataSource()
    private(set) var viewModel: CVDemoViewModelType
    
    init(viewModel: CVDemoViewModelType = CVDemoViewModel()) {
        self.viewModel = viewModel
        super.init(style: .plain)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.viewModel = CVDemoViewModel()
        super.init(coder: aDecoder)
    }
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupNaviationItems()
        bindViewModel()
        
        viewModel.viewDidLoad()
    }
    
    private func setupTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        tableView.registerReusableCell(CVTextCell.self)
        tableView.registerReusableCell(CVExperienceCell.self)
        tableView.dataSource = dataSource
        tableView.allowsSelection = false
    }
    
    private func setupNaviationItems() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh,
                                                            target: self,
                                                            action: #selector(refreshButtonTapped))
    }
    
    
    // N.B. The code below makes more sense if you're using a framework like ReactiveSwift, RxSwift or Combine
    // (but the view model input-output principles still apply here and I'm just demoing how we can make
    // our UI "react" to changes in the view model)
    
    private func bindViewModel() {
        
        // Whenever the data source models change, reload the UI
        viewModel.shouldReloadUI = { [weak self] updatedModel in
            self?.reloadUI(with: updatedModel)
        }
        
        // Whenever an error message is emitted, show the error
        viewModel.shouldShowErrorMessage = { [weak self] message in
            self?.showErrorAlert(message: message)
        }
        
        // Whenever network activity is happening, show an activity indicator (and hide it when finished)
        viewModel.shouldShowNetworkActivity = { showNetworkActivity in
            UIApplication.shared.isNetworkActivityIndicatorVisible = showNetworkActivity
        }
    }
    
    private func reloadUI(with updatedModel: CVModel) {
        self.title = updatedModel.candidateName
        dataSource.populate(with: updatedModel)
        tableView.reloadData()
    }
    
    @objc private func refreshButtonTapped() {
        viewModel.tapRefreshButton()
    }
}


