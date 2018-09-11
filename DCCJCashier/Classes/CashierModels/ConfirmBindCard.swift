//
//  ConfirmBindCard.swift
//  DCCJ_New
//
//  Created by 刘汤圆 on 2018/7/10.
//  Copyright © 2018年 yongda. All rights reserved.
//

import Foundation

@objc public class ConfirmBindCard: NSObject, Codable {
    public let success: Bool
    public let message: String?
    public init(success: Bool, message: String?) {
        self.success = success
        self.message = message
    }
}
