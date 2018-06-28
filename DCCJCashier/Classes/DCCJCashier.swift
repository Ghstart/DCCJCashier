//
//  DCCJCashier.swift
//  DCCJCashier
//
//  Created by 龚欢 on 2018/6/28.
//  Copyright © 2018年 龚欢. All rights reserved.
//

import Foundation
//import DCCJNetwork

public final class DCCJCashier: NSObject {
    
    open static let shared = DCCJCashier()
    
    private override init() {}
    
    public func testObject() -> String { return "" }
}

//public class DCCJCashier: NSObject {
//    public static let shared = DCCJCashier()
//    private override init() {}
//
//    public func config() {
//        DCCJNetwork.shared.config(host: "host", logKey: "ket") { (md) -> String in
//            return ""
//        }
//    }
//
//    public func showCashier() {
//        print("DCCJCashier...")
//    }
//}
