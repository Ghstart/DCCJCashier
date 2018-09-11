//
//  RequestBindCard.swift
//  DCCJ_New
//
//  Created by 刘汤圆 on 2018/7/10.
//  Copyright © 2018年 yongda. All rights reserved.
//

import Foundation

@objc public class RequestBindCard: NSObject, Codable {
    public let result: DCSingelBindCardResponseInfo?
    public let success: Bool
    public let message: String?
    public init(r: DCSingelBindCardResponseInfo?, success: Bool, message: String?) {
        self.result = r
        self.success = success
        self.message = message
    }
}

@objc public class DCSingelBindCardResponseInfo: NSObject, Codable {
    public let phone: String
    public let signReqId: String
    public init(token: String, phone: String, smsSender: String, signReqId: String) {
        self.phone = phone
        self.signReqId = signReqId
    }
}
