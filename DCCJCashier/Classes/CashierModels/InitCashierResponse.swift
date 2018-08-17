//
//  InitCashierResponse.swift
//  Base64
//
//  Created by 龚欢 on 2018/8/17.
//

import Foundation

public struct InitCashierResponse: Codable {
    public let result: InitCashierDetailResponse?
    public let otherPayTypeInfoList: [InitCashierOtherPayResponse]
    public let isMessage: Bool
    public let phone: String
    public let success: Bool
}

public struct InitCashierDetailResponse: Codable {
    public let bankCard: String
    public let bankCardId: String
    public let bankCode: String
    public let bankName: String
    public let isMaintain: Bool
    public let isShow: Bool
    public let isSigned: Bool
    public let payType: String
}

public struct InitCashierOtherPayResponse: Codable {
    public let isShow: Bool
    public let isOpened: Bool?
    public let payType: String?
}
