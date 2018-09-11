//
//  InitCashierBankCards.swift
//  DCCJCashier
//
//  Created by 龚欢 on 2018/7/13.
//

import Foundation

public struct InitCashierBankCardsResponse: Codable {
    public let result: InitCashierBankCards?
    public let success: Bool
}

public struct InitCashierBankCards: Codable {
    public let bankInfos: [InitCashierBankCardItem]?
}

public struct InitCashierBankCardItem: Codable {
    public let accountName: String
    public let bankCardId: String?
    public let bankCardNo: String
    public let bankCode: String
    public let bankName: String
    public let cardType: String
    public let cvv: String?
    public let idCard: String
    public let phone: String
    public let validDate: String?
}
