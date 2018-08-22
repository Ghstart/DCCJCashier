//
//  InitCashierResponse.swift
//  Base64
//
//  Created by 龚欢 on 2018/8/17.
//

import Foundation

public struct InitCashierResponse: Codable {
    public let result: InitCashierBankInfosResponse?
    public let success: Bool
}

public extension InitCashierResponse {
    public var availableBankCards: [InitCashierDetailResponse] {
        if let bankCardInfos = self.result?.bankCardInfos {
            return bankCardInfos.filter { $0.isShow && !$0.isMaintain }
        } else {
            return []
        }
    }
    
    public var unavailableBankCards: [InitCashierDetailResponse] {
        if let bankCardInfos = self.result?.bankCardInfos {
            return bankCardInfos.filter { $0.isShow && $0.isMaintain }
        } else {
            return []
        }
    }
    
    public var defaultCashierBankCardsItem: InitCashierDetailResponse? {
        return self.availableBankCards.first
    }
    
    public var showPayButtonTitle: String {
        if self.availableBankCards.count == 0 && self.unavailableBankCards.count == 0 {
            return "添加银行卡"
        } else  if self.availableBankCards.count > 0 {
            return "立即付款"
        } else {
            return "请选择付款方式"
        }
    }
}

public struct InitCashierBankInfosResponse: Codable {
    public let bankCardInfos: [InitCashierDetailResponse]
    public let otherPayTypeInfoList: [InitCashierOtherPayResponse]
    public let isMessage: Bool
    public let phone: String
}

public struct InitCashierDetailResponse: Codable, Equatable {
    public let bankCard: String
    public let bankCardId: String
    public let bankCode: String
    public let bankName: String
    public let isMaintain: Bool
    public let isShow: Bool
    public let isSigned: Bool
    public let payType: String
}

public extension InitCashierDetailResponse {
    public var detailBankCardNumberAndBankName: String {
        let index = self.bankCard.index(self.bankCard.endIndex, offsetBy: -4)
        return "\(self.bankName)(尾号\(self.bankCard[index...]))"
    }
}

public struct InitCashierOtherPayResponse: Codable {
    public let isShow: Bool
    public let isOpened: Bool?
    public let payType: String?
}
