//
//  Coordinator.swift
//  synbiotix
//
//  Created by Vasilis Neophytou on 21/10/2023.
//

import Foundation
import SwiftUI

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController? { get }
    var childCoordinators: [Constants.CoordinatorKeys:Coordinator] { get set }
    
    func start()
    func addChild(coordinator: Coordinator, with key: Constants.CoordinatorKeys)
    func removeChild(coordinator: Coordinator)
}

extension Coordinator {
    func addChild(coordinator: Coordinator, with
        key: Constants.CoordinatorKeys) {
        
        childCoordinators[key] = coordinator
    }
    
    func removeChild(coordinator: Coordinator) {
        childCoordinators = childCoordinators.filter {
            $0.value !== coordinator
        }
    }
    
    func removeChild(_ key: Constants.CoordinatorKeys) {
        if let coord = childCoordinators[key] {
            removeChild(coordinator: coord)
        }
    }

}

// MARK: Controller Navigation
extension Coordinator {
    
    func navigate(to view: some View, with presentationStyle: navigationStyle, animated: Bool = true, resetingStack: Bool = false) {
        let viewController = UIHostingController(rootView: view.navigationBarBackButtonHidden(true))
        viewController.navigationItem.hidesBackButton = true
        switch presentationStyle {
        case .present:
            navigationController?.present(viewController, animated: animated, completion: nil)
        case .push:
            navigationController?.pushViewController(viewController, animated: animated)
        }
    }
    
    func navigateUI(to viewController: UIViewController, with presentationStyle: navigationStyle, animated: Bool = true, resetingStack: Bool = false) {
        switch presentationStyle {
        case .present:
            navigationController?.present(viewController, animated: animated, completion: nil)
        case .push:
            navigationController?.pushViewController(viewController, animated: animated)
        }
    }
    
    func popToRoot() {
        navigationController?.popToRootViewController(animated: true)
    }
    
}

enum navigationStyle {
    case present
    case push
}
