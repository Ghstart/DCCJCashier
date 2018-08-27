//
//  CheckBankCardBin.swift
//  DCCJCashier
//
//  Created by 龚欢 on 2018/8/27.
//

import Foundation

public struct CheckBankCardBinResponse: Codable {
    public var resultCode: String
    public var data: CheckBankCardBindDetailResponse?
    public var resultMessage: String
    public var success: Bool
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
    public var cardType: Int
    public var userReservedPhoneNumber: String?
}
