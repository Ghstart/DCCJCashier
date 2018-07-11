//
//  DCCJCashier.swift
//  DCCJCashier
//
//  Created by 龚欢 on 2018/6/28.
//  Copyright © 2018年 龚欢. All rights reserved.
//

import Foundation
import DCCJNetwork


public final class DCCJCashier: NSObject {
    
    private let network: DCCJNetwork
    
    public init(network: DCCJNetwork) {
        self.network = network
    }
    
    public func request(type t: ObjcCashierRequests,
                        with d: Dictionary<String, Any> = [:],
                        callBack: @escaping (Any?, NSError?) -> Void) {
        self._request(q: CashierRequests.send(type: t, data: d), callBack: callBack)
    }
    
    private func _request(q: CashierRequests, callBack: @escaping (Codable?, NSError?) -> Void) {
        switch q {
        case .send(let type, _):
            switch type {
            case .bindCardAndToSupportBankCard:
                self.network.requestBy(q) { (responseData: SupportBankCardResponse?, e) in
                    print(responseData ?? "")
                    callBack(responseData, e?.error())
                }
            case .bindCardAndCheckCard:
                self.network.requestBy(q) { (responseData: CheckCardResponse?, e) in
                    print(responseData ?? "")
                    callBack(responseData, e?.error())
                }
            case .requestBindCard:
                self.network.requestBy(q) { (responseData: RequestBindCard?, e) in
                    print(responseData ?? "")
                    callBack(responseData, e?.error())
                }
            case .resendMsgCode:
                self.network.requestBy(q) { (responseData: ResendVerifyCode?, e) in
                    print(responseData ?? "")
                    callBack(responseData, e?.error())
                }
            case .confirmBindCard:
                self.network.requestBy(q) { (responseData: ConfirmBindCard?, e) in
                    print(responseData ?? "")
                    callBack(responseData, e?.error())
                }
                
            default:
                self.network.requestBy(q) { (responseData: SupportBankCardResponse?, error) in
                    
                }
            }
        }
    }
}

@objc public enum ObjcCashierRequests: Int {
    case initCashier
    case bindCardAndToSupportBankCard
    case bindCardAndCheckCard
    case requestBindCard
    case resendMsgCode
    case confirmBindCard
}

enum CashierRequests {
    case send(type: ObjcCashierRequests, data: [String: Any])
}

extension CashierRequests: Request {
    var response: Codable {
        return SupportBankCardResponse.Type.self as! Codable
    }

    public var host: String {
//        switch self {
//        case .send(let type, _):
//            switch type {
//            case .bindCardAndCheckCard:
//                return DCCJNetwork.shared.hostMaps[.staging]!
//            default:
//                return DCCJNetwork.shared.hostMaps[.cashier_staging]!
//            }
//        }
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
                return "/checkCard"
            case .requestBindCard:
                return "/bindingCard"
            case .resendMsgCode:
                return "/sendSms"
            case .confirmBindCard:
                return "/bindingCardConfirm"
                
            }
        }
    }
    
    public var method: HTTPMethod {
        switch self {
        case .send(let type, _):
            switch type {
            case .bindCardAndToSupportBankCard:
                return .GET
            default:
                return .POST
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

