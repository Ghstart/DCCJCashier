//
//  ResendVerifyCode.swift
//  DCCJ_New
//
//  Created by 刘汤圆 on 2018/7/10.
//  Copyright © 2018年 yongda. All rights reserved.
//

import Foundation
import DCCJNetwork

@objc public class ResendVerifyCode: NSObject, Codable, DCCJResponseCodeDataSource {
    let result: ResendMsgCode?
    let success: Bool
    let message: String?
    init(r: ResendMsgCode?, success: Bool, message: String?) {
        self.result = r
        self.success = success
        self.message = message
    }
}

@objc public class ResendMsgCode: NSObject, Codable {
    let signReqId: String
    let phone: String
    init(signReqId: String, phone: String) {
        self.signReqId = signReqId
        self.phone = phone
    }
}
