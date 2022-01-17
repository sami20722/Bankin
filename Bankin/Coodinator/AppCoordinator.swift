//
//  AppCoordinator.swift
//  Bankin
//
//  Created by ben lassoued sami on 17/01/2022.
//

import UIKit

protocol Coordinator {
    var parentCoordinator: Coordinator? { get set }
    var children: [Coordinator] { get set }
    var navigationController : UINavigationController { get set }
    func goToHomePage()
    func start()
}


class AppCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    init(navCon : UINavigationController) {
        self.navigationController = navCon
    }
    func start() {
        print("App Coordinator Start")
        goToHomePage()
    }
    
    func goToHomePage(){
            // Instantiate LoginViewController
            let homeViewController = HomeViewController()
            // Instantiate LoginViewModel
            let service = Service()
            let homeViewModel = HomeViewModel.init(apiClient: service)
            // Set the Coordinator to the ViewModel
            homeViewModel.coordinator = self
            // Set the ViewModel to ViewController
            homeViewController.viewModel = homeViewModel
            // Push it.
           navigationController.pushViewController(homeViewController, animated: true)
       }
}
