//
//  BankInfo.swift
//  DCCJ_New
//
//  Created by 龚欢 on 2018/7/6.
//  Copyright © 2018年 yongda. All rights reserved.
//

import Foundation

public struct SupportBankCardResponse: Codable {
    public let result: SupportBankCard?
    public let success: Bool
    public let message: String?
}

public struct SupportBankCard: Codable {
    public let authStatus: Int
    public let bankInfos: [DCSingleBindBankInfos]
}

public struct DCSingleBindBankInfos: Codable {
    public let validDate: String?
    public let cvv: String?
    public let idCard: String
    public let accountName: String
    public let phone: String
    public let bankCardId: String
    public let cardType: String
    public let bankCardNo: String
    public let bankCode: String
    public let bankName: String
    public let isSupport: Bool
}
