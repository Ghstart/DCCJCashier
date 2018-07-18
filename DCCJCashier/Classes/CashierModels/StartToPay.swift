//
//  StartToPay.swift
//  DCCJCashier
//
//  Created by 龚欢 on 2018/7/17.
//

import Foundation

@objc public class StartToPayResponse: NSObject, Codable {
    let result: StartToPayDetailResponse?
    let success: Bool
    let message: String?
    init(r: StartToPayDetailResponse?, success: Bool, message: String?) {
        self.result = r
        self.success = success
        self.message = message
    }
}

@objc public class StartToPayDetailResponse: NSObject, Codable {
    let phone: String
    let resultCode: String
    let resultMsg: Int
    let cmfSeqNo: Int
    init(phone: String, resultCode: String, resultMsg: Int, cmfSeqNo: Int) {
        self.phone = phone
        self.resultCode = resultCode
        self.resultMsg = resultMsg
        self.cmfSeqNo = cmfSeqNo
    }
}
