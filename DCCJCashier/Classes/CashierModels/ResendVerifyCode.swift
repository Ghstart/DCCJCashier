//
//  ResendVerifyCode.swift
//  DCCJ_New
//
//  Created by 刘汤圆 on 2018/7/10.
//  Copyright © 2018年 yongda. All rights reserved.
//

import Foundation

@objc public class ResendVerifyCode: NSObject, Codable {
    public let result: ResendMsgCode?
    public let success: Bool
    public let message: String?
    public init(r: ResendMsgCode?, success: Bool, message: String?) {
        self.result = r
        self.success = success
        self.message = message
    }
}

@objc public class ResendMsgCode: NSObject, Codable {
    public let signReqId: String
    public let phone: String
    public init(signReqId: String, phone: String) {
        self.signReqId = signReqId
        self.phone = phone
    }
}
