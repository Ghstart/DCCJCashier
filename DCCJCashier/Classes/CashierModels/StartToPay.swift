//
//  StartToPay.swift
//  DCCJCashier
//
//  Created by 龚欢 on 2018/7/17.
//

import Foundation

public struct StartToPayResponse: Codable {
    public let result: StartToPayDetailResponse?
    public let success: Bool
    public let message: String?
}

public struct StartToPayDetailResponse: Codable {
    public let phone: String
    public let resultCode: String
    public let resultMsg: String
    public let cmfSeqNo: String
}
