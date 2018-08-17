//
//  ViewController.swift
//  DCCJCashier
//
//  Created by Ghstart on 06/28/2018.
//  Copyright (c) 2018 Ghstart. All rights reserved.
//

import UIKit
import DCCJCashier
import DCCJNetwork
import DCCJConfig

class ViewController: UIViewController {

    @IBAction func showBankCardLists(_ sender: Any) {
        let cashier = DCCJCashier(net: DCCJNetwork())
        /*present*/
        //cashier.present(page: .bankCardLists, on: self)
        /*navigator*/
        //cashier.navigator(page: .bankCardLists, on: self.navigationController)
        /*request*/
        cashier.request(with: .send(type: .requestToPay, data: Dictionary<String, Any>())).data.observe { (result: Result<CashierSuppoerBankCardsResponse>) in
            
        }
    }
}

