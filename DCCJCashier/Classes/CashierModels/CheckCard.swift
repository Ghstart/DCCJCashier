//
//  CheckCard.swift
//  DCCJCashier
//
//  Created by 龚欢 on 2018/7/10.
//

import Foundation

public struct CheckCardResponse: Codable {
    public let result: CheckCard?
    public let success: Bool
    public let message: String?
}

public struct CheckCard: Codable {
    public let bankCode: String
    public let bankName: String
    public let cardType: String
}
