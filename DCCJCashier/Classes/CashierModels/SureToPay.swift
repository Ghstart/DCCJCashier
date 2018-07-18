//
//  SureToPay.swift
//  DCCJCashier
//
//  Created by 龚欢 on 2018/7/17.
//

import Foundation

@objc public class SureToPayResponse: NSObject, Codable {
    let result: SureToPayDetailResponse?
    let success: Bool
    let message: String?
    init(r: SureToPayDetailResponse?, success: Bool, message: String?) {
        self.result = r
        self.success = success
        self.message = message
    }
}

@objc public class SureToPayDetailResponse: NSObject, Codable {
    let returnUrl: String
    let resultCode: String
    let resultMsg: Int
    let cmfSeqNo: Int
    init(returnUrl: String, resultCode: String, resultMsg: Int, cmfSeqNo: Int) {
        self.returnUrl = returnUrl
        self.resultCode = resultCode
        self.resultMsg = resultMsg
        self.cmfSeqNo = cmfSeqNo
    }
}
