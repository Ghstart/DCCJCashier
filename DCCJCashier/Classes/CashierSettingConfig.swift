//
//  CashierSettingConfig.swift
//  DCCJCashier
//
//  Created by 龚欢 on 2018/7/27.
//

import Foundation

public enum CashierPages {
    case bankCardLists
}

public enum CashierRequestTypes {
    case requestInitCashier
    case supportBankCards
    case requestCheckPayPassword
    case requestToPay
    case requestToSurePay
    case requestBindCardAndCheckCard
    case requestBindCard
    case confirmBindCard
    case closeCashier
    case checkBankCardBin
}
