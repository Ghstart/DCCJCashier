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
    case requestCashierSupportBankCards
    case requestBindCardAndToSupportBankCard
    case requestCheckPayPassword
    case requestToPay
    case requestToSurePay
    case requestBindCardAndCheckCard
    case requestBindCard
    case resendMsgCode
    case confirmBindCard
}
