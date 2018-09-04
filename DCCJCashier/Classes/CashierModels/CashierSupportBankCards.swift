//
//  CashierSupportBankCards.swift
//  DCCJCashier
//
//  Created by 龚欢 on 2018/7/13.
//

import Foundation

public struct CashierSuppoerBankCardsResponse: Codable {
    public let success: Bool
    public let result: CashierSuppoerBankCards?
    public let message: String?
}

public struct CashierSuppoerBankCards: Codable {
    public let bankInfos: [CashierSuppoerBankCardItem]
}

public struct CashierSuppoerBankCardItem: Codable {
    public let bankCode: String
    public let bankName: String
    public let dayAmountLimit: String
    public let singleAmountLimit: String
}
