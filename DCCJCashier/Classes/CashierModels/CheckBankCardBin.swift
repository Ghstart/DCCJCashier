//
//  CheckBankCardBin.swift
//  DCCJCashier
//
//  Created by 龚欢 on 2018/8/27.
//

import Foundation

public enum CheckBankCardBinTypes: Int, Codable {
    case debit = 1
    case credit
    case cunzhe
    case unknow
    
    var displayName: String {
        switch self {
        case .debit:
            return "储蓄卡"
        case .credit:
            return "信用卡"
        case .cunzhe:
            return "存折"
        case .unknow:
            return "未知"
        }
    }
}

public struct CheckBankCardBindDetailResponse: Codable {
    public var bankCardID: String?
    public var bankCardNum: String?
    public var bankCode: String
    public var bankIcon: String?
    public var bankName: String
    public var bindPrecedureToken: String?
    public var cardAttribute: String
    public var cardStatus: String?
    public var cardStatusDesc: String?
    public var cardType: CheckBankCardBinTypes
    public var userReservedPhoneNumber: String?
}
