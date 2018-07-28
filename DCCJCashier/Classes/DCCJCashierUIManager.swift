//
//  DCCJCashierUIManager.swift
//  DCCJCashier
//
//  Created by 龚欢 on 2018/7/26.
//

import Foundation

class DCCJCashierUIManager {
    
    private var existNavigation: UINavigationController? = nil
    
    public func uiManagerNavigator(page: CashierPages, on nav: UINavigationController? = nil) {
        if let navigationController = nav { self.existNavigation = navigationController }
        
        guard let n = self.existNavigation else { fatalError("None UINavigationController Exists!!!") }
        
        let navigator = CashierNavigator(navigationController: n)
        navigator.navigator(to: page)
    }
    
    public func uiManagerPresent(page: CashierPages, on vc: UIViewController) {
        let navigator = CashierNavigator()
        navigator.present(to: page, from: vc)
    }
    
}
