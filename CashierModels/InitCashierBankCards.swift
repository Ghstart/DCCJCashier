//
//  InitCashierBankCards.swift
//  DCCJCashier
//
//  Created by 龚欢 on 2018/7/13.
//

import Foundation

@objc public class InitCashierBankCardsResponse: NSObject, Codable {
    let result: InitCashierBankCards?
    let success: Bool
    let message: String?
    init(result: InitCashierBankCards?, success: Bool, message: String?) {
        self.result = result
        self.message = message
        self.success = success
    }
}

@objc public class InitCashierBankCards: NSObject, Codable {
    let bankCardInfos: [InitCashierBankCardItem]
    let phone: String
    let isMessage: Bool
    init(bankCardInfos: [InitCashierBankCardItem], phone: String, isMessage: Bool) {
        self.bankCardInfos = bankCardInfos
        self.phone = phone
        self.isMessage = isMessage
    }
}

@objc public class InitCashierBankCardItem: NSObject, Codable {
    let bankCard: String
    let bankCardId: String
    let bankCode: String
    let bankName: String
    let isMaintain: Bool
    let isShow: Bool
    let isSigned: Bool
    let payType: String
    init(bankCard: String, bankCardId: String, bankCode: String, bankName: String, isMaintain: Bool, isShow: Bool, isSigned: Bool, payType: String) {
        self.bankCard = bankCard
        self.bankCardId = bankCardId
        self.bankCode  = bankCode
        self.bankName = bankName
        self.isMaintain = isMaintain
        self.isShow = isShow
        self.isSigned = isSigned
        self.payType = payType
    }
}
