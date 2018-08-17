//
//  InitCashierBankCards.swift
//  DCCJCashier
//
//  Created by 龚欢 on 2018/7/13.
//

import Foundation

public struct InitCashierBankCardsResponse: Codable {
    public let data: InitCashierBankCards?
    public let success: Bool
    public let resultMessage: String?
    public let resultCode: String
}

public struct InitCashierBankCards: Codable {
    public let bankCardList: [InitCashierBankCardItem]
}

public struct InitCashierBankCardItem: Codable {
    public let bankCardDesc: String?
    public let bankCardID: String
    public let bankCardNum: String
    public let bankCode: String?
    public let bankIcon: String?
    public let bankName: String
    public let cardStatus: Int
    public let cardType: String
}
