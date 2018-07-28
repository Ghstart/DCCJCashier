//
//  CashierNavigator.swift
//  DCCJCashier
//
//  Created by 龚欢 on 2018/7/26.
//

import Foundation
import DCCJNavigator

class CashierNavigator: DCCJNavigator {
    
    typealias Destination = CashierPages

    private weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    init() {
        self.navigationController = nil
    }
    
    public func navigator(to destination: CashierNavigator.Destination) {
        let viewController = makeViewController(for: destination)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    public func present(to destination: Destination, from vc: UIViewController) {
        let viewController = makeViewController(for: destination)
        vc.present(viewController, animated: true, completion: nil)
    }
    
    // MARK: - Private Methods
    private func makeViewController(for destination: Destination) -> UIViewController {
        switch destination {
        case .bankCardLists:
            return DCCJCashierBankCardsListViewController(nibName: "DCCJCashierBankCardsListViewController", bundle: Bundle(for: DCCJCashierBankCardsListViewController.self))
        }
    }
    
}
