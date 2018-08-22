//
//  DCCJCashier.swift
//  DCCJCashier
//
//  Created by 龚欢 on 2018/6/28.
//  Copyright © 2018年 龚欢. All rights reserved.
//

import Foundation
import DCCJNetwork
import DCCJConfig

public final class DCCJCashier: NSObject {
    
    private let network: DCCJNetwork
    
    public init(net: DCCJNetwork) {
        self.network = net
    }
    
    public func request<Value: Codable>(with r: CashierRequests) -> (data: Future<Value>, task: URLSessionDataTask?) {
        let (d, t) = self.network.request(with: r)
        
        let unboxData: Future<Value> = d.unboxed()
        
        return (data: unboxData, task: t)
    }
}


public enum CashierRequests {
    case send(type: CashierRequestTypes, data: [String: Any])
}

extension CashierRequests: Request {
    var response: Codable {
        return SupportBankCardResponse.Type.self as! Codable
    }

    public var host: NetworkEnvironment {
        return .cashier_staging
    }
    
    public var path: String {
        switch self {
        case .send(let type, _):
            switch type {
            case .requestInitCashier:
                return "order/bankList"
            case .requestCashierSupportBankCards:
                return "/supportBanks"
            case .requestBindCardAndToSupportBankCard:
                return "/supportedBankCard"
            case .requestCheckPayPassword:
                return "order/payPwdCheck"
            case .requestToPay:
                return "/payAction"
            case .requestToSurePay:
                return "/payConfirm"
            case .requestBindCardAndCheckCard:
                return "/checkCard"
            case .requestBindCard:
                return "/bindingCard"
            case .resendMsgCode:
                return "/sendSms"
            case .confirmBindCard:
                return "/bindingCardConfirm"
            case .closeCashier:
                return "order/closeCashierDesk"
            }
        }
    }
    
    public var method: HTTPMethod {
        switch self {
        case .send(let type, _):
            switch type {
            case .requestBindCardAndToSupportBankCard:
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

