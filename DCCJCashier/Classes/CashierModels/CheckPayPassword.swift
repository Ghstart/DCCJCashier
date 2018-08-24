//
//  CheckPayPassword.swift
//  DCCJCashier
//
//  Created by 龚欢 on 2018/7/17.
//

import Foundation

public struct CheckPayPasswordResponse: Codable {
    let success: Bool
    let result: String?
    let message: String?
}
