//
//  CVDemoViewModel.swift
//  CVDemo
//
//  Created by Shilan Patel on 14/06/2019.
//  Copyright © 2019 Shilan Patel. All rights reserved.
//

import Foundation


// MARK: - CVDemoViewModelType protocol
protocol CVDemoViewModelType {
    
    // INPUTS (i.e. triggers such as button taps, text input, view life cycle methods)
    
    // Input method triggered when the view has loaded
    func viewDidLoad()
    
    // Input method triggered when the user taps the refresh button
    func tapRefreshButton()
    

    // OUTPUTS (i.e. data telling the UI what data to display, current error message,
    // signals to navigate to a new screen etc)
    //
    // (N.B. This code makes more sense if you use a Reactive / Rx framework or even Apple's newest
    // "Combine" framework announced at WWDC 2019)
    
    // Emits a signal whenever the view model has changed
    var shouldReloadUI: ((CVModel) -> Void)? { get set }
    
    // Emits a signal to display an error message
    var shouldShowErrorMessage: ((String) -> Void)? { get set }
    
    // Emits a signal whenever the view should show a network activity spinner
    var shouldShowNetworkActivity: ((Bool) -> Void)? { get set }    
}



// MARK: - CVDemoViewModel
class CVDemoViewModel: CVDemoViewModelType {
    
    // MARK: - Dependencies
    private let dataService: CVDataServiceType
    
    // MARK: - Outputs
    var shouldReloadUI: ((CVModel) -> Void)?
    var shouldShowErrorMessage: ((String) -> Void)?
    var shouldShowNetworkActivity: ((Bool) -> Void)?

    
    // MARK: - Init
    init(dataService: CVDataServiceType = CVDataService.default) {
        self.dataService = dataService
    }
    
    // MARK: - Inputs
    func viewDidLoad() {
        reloadCV()
    }
    
    func tapRefreshButton() {
        reloadCV()
    }
    
    private func reloadCV() {
        
        shouldShowNetworkActivity?(true)
        
        dataService.getCV { [weak self] result in
            guard let `self` = self else { return }
            
            self.shouldShowNetworkActivity?(false)
            
            switch result {
            case let .success(model):
                self.shouldReloadUI?(model)
            case let .failure(error):
                self.shouldShowErrorMessage?(error.localizedDescription)
            }
        }
    }
    
}
