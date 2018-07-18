//
//  CheckCard.swift
//  DCCJCashier
//
//  Created by 龚欢 on 2018/7/10.
//

import Foundation

@objc public class CheckCardResponse: NSObject, Codable {
    let result: CheckCard?
    let success: Bool
    let message: String?
    init(r: CheckCard?, success: Bool, message: String?) {
        self.result = r
        self.success = success
        self.message = message
    }
}

@objc public class CheckCard: NSObject, Codable {
    let bankCode: String
    let bankName: String
    let cardType: String
    init(bankCode: String, bankName: String, cardType: String) {
        self.bankCode = bankCode
        self.bankName = bankName
        self.cardType = cardType
    }
}
