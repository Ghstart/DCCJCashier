//
//  BankInfo.swift
//  DCCJ_New
//
//  Created by 龚欢 on 2018/7/6.
//  Copyright © 2018年 yongda. All rights reserved.
//

import Foundation
import DCCJNetwork

@objc public class SupportBankCardResponse: NSObject, Codable, DCCJResponseCodeDataSource {
    let result: SupportBankCard?
    let success: Bool
    let message: String?
    init(r: SupportBankCard?, success: Bool, message: String?) {
        self.result = r
        self.success = success
        self.message = message
    }
}

@objc public class SupportBankCard: NSObject, Codable {
    let authStatus: Int
    let bankInfos: [DCSingleBindBankInfos]
    init(au: Int, bankInfos: [DCSingleBindBankInfos]) {
        self.authStatus = au
        self.bankInfos = bankInfos
    }
}

@objc public class DCSingleBindBankInfos: NSObject, Codable {
    let validDate: String?
    let cvv: String?
    let idCard: String
    let accountName: String
    let phone: String
    let bankCardId: String
    let cardType: String
    let bankCardNo: String
    let bankCode: String
    let bankName: String
    let isSupport: Bool
    
    init(v: String?, c: String?, idCard: String, acc: String, phone: String, bankCardId: String, cardType: String, bankCardNo: String, bankCode: String, bankName: String, isSupport: Bool) {
        self.validDate = v
        self.cvv = c
        self.idCard = idCard
        self.accountName = acc
        self.phone = phone
        self.bankCardId = bankCardId
        self.cardType = cardType
        self.bankCardNo = bankCardNo
        self.bankCode = bankCode
        self.bankName = bankName
        self.isSupport = isSupport
    }
}
