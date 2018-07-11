//
//  RequestBindCard.swift
//  DCCJ_New
//
//  Created by 刘汤圆 on 2018/7/10.
//  Copyright © 2018年 yongda. All rights reserved.
//

import Foundation
import DCCJNetwork

@objc public class RequestBindCard: NSObject, Codable, DCCJResponseCodeDataSource {
    let result: DCSingelBindCardResponseInfo?
    let success: Bool
    let message: String?
    init(r: DCSingelBindCardResponseInfo?, success: Bool, message: String?) {
        self.result = r
        self.success = success
        self.message = message
    }
}

@objc public class DCSingelBindCardResponseInfo: NSObject, Codable {
    let phone: String
    let signReqId: String
    init(token: String, phone: String, smsSender: String, signReqId: String) {
        self.phone = phone
        self.signReqId = signReqId
    }
}
