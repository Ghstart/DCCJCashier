//
//  DCCJCashier.swift
//  DCCJCashier
//
//  Created by 龚欢 on 2018/6/28.
//  Copyright © 2018年 龚欢. All rights reserved.
//

import Foundation
import DCCJNetwork
import DCCJUser

public final class DCCJCashier: NSObject, DCCJNetworkDelegate, DCCJNetworkDataSource {
    
    public static let shared = DCCJCashier()
    private override init() {}
    
    public func request(type t: ObjcCashierRequests,
                        with d: Dictionary<String, Any> = [:],
                        callBack: @escaping (Any?, NSError?) -> Void) {
        self._request(q: CashierRequests.send(type: t, data: d), callBack: callBack)
    }
    
    private func _request(q: CashierRequests, callBack: @escaping (Codable?, NSError?) -> Void) {
        let net = DCCJNetwork.shared
        net.delegate    = self
        net.dataSource  = self
        switch q {
        case .send(let type, _):
            switch type {
            case .bindCardAndToSupportBankCard:
                DCCJNetwork.shared.requestBy(q) { (responseData: SupportBankCardResponse?, e) in
                    print(responseData ?? "")
                    callBack(responseData, e?.error())
                }
            default:
                DCCJNetwork.shared.requestBy(q) { (responseData: SupportBankCardResponse?, error) in
                    
                }
            }
        }
    }
    
    /*Error Code = 201*/
    public func errorCodeEqualTo201() {
        DCCJUser.setToken("", callback: nil)
    }
    
    /*Return Header Fields*/
    public func customHttpHeaders() -> Dictionary<String, String> {
        return ["accessToken": DCCJUser.getToken()]
    }
}

@objc public enum ObjcCashierRequests: Int {
    case initCashier
    case bindCardAndToSupportBankCard
    case bindCardAndCheckCard
}

enum CashierRequests {
    case send(type: ObjcCashierRequests, data: [String: Any])
}

extension CashierRequests: Request {
    var response: Codable {
        return SupportBankCardResponse.Type.self as! Codable
    }

    public var host: String {
        return DCCJNetwork.shared.hostMaps[.cashier_staging]!
    }
    
    public var path: String {
        switch self {
        case .send(let type, _):
            switch type {
            case .initCashier:
                return "/bankList"
            case .bindCardAndToSupportBankCard:
                return "/supportedBankCard"
            case .bindCardAndCheckCard:
                return ""
            }
        }
    }
    
    public var method: HTTPMethod {
        switch self {
        case .send(let type, _):
            switch type {
            case .initCashier, .bindCardAndCheckCard:
                return .POST
            case .bindCardAndToSupportBankCard:
                return .GET
            }
        }
    }
    
    public var paramters: [String : Any] {
        switch self {
        case .send(_, let data):
            return data
        }
    }
}

