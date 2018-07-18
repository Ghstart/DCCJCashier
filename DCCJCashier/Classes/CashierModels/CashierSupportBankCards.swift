//
//  CashierSupportBankCards.swift
//  DCCJCashier
//
//  Created by 龚欢 on 2018/7/13.
//

import Foundation

@objc public class CashierSuppoerBankCardsResponse: NSObject, Codable {
    let success: Bool
    let result: CashierSuppoerBankCards?
    let message: String?
    init(success: Bool, result: CashierSuppoerBankCards?, message: String?) {
        self.success = success
        self.result = result
        self.message = message
    }
}

@objc public class CashierSuppoerBankCards: NSObject, Codable {
    let bankInfos: [CashierSuppoerBankCardItem]
    init(bankInfos: [CashierSuppoerBankCardItem]) {
        self.bankInfos = bankInfos
    }
}

@objc public class CashierSuppoerBankCardItem: NSObject, Codable {
    let bankCode: String
    let bankName: String
    let dayAmountLimit: String
    let singleAmountLimit: String
    init(bankCode: String, bankName: String, dayAmountLimit: String, singleAmountLimit: String) {
        self.bankName = bankName
        self.bankCode = bankCode
        self.dayAmountLimit = dayAmountLimit
        self.singleAmountLimit = singleAmountLimit
    }
}
