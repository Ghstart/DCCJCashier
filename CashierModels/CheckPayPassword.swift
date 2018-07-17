//
//  CheckPayPassword.swift
//  DCCJCashier
//
//  Created by 龚欢 on 2018/7/17.
//

import Foundation

@objc public class CheckPayPasswordResponse: NSObject, Codable {
    let success: Bool
    let result: String
    let message: String?
    init(success: Bool, result: String, message: String?) {
        self.success = success
        self.result = result
        self.message = message
    }
}
