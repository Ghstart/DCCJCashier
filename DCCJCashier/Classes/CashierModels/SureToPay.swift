//
//  SureToPay.swift
//  DCCJCashier
//
//  Created by 龚欢 on 2018/7/17.
//

import Foundation

public struct SureToPayResponse: Codable {
    public let result: SureToPayDetailResponse?
    public let success: Bool
    public let message: String?
}

public struct SureToPayDetailResponse: Codable {
    public let returnUrl: String
    public let resultCode: String
    public let resultMsg: String
    public let cmfSeqNo: String
}
