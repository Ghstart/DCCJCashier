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
            case .requestInitCashier:
                self.network.requestBy(q) { (result: Result<InitCashierBankCardsResponse, DataManagerError>) in
                    switch result {
                    case .success(let response) :
                        callBack(response, nil)
                    case .failure(let e) :
                        callBack(nil, e as NSError)
                    }
                }
            case .requestCashierSupportBankCards:
                self.network.requestBy(q) { (result: Result<CashierSuppoerBankCardsResponse, DataManagerError>) in
                    switch result {
                    case .success(let response) :
                        callBack(response, nil)
                    case .failure(let e) :
                        callBack(nil, e as NSError)
                    }
                }
            case .requestBindCardAndToSupportBankCard:
                self.network.requestBy(q) { (result: Result<SupportBankCardResponse, DataManagerError>) in
                    switch result {
                    case .success(let response) :
                        callBack(response, nil)
                    case .failure(let e) :
                        callBack(nil, e as NSError)
                    }
                }
            case .requestBindCardAndCheckCard:
                self.network.requestBy(q) { (result: Result<CheckCardResponse, DataManagerError>) in
                    switch result {
                    case .success(let response) :
                        callBack(response, nil)
                    case .failure(let e) :
                        callBack(nil, e as NSError)
                    }
                }
            case .requestBindCard:
                self.network.requestBy(q) { (result: Result<RequestBindCard, DataManagerError>) in
                    switch result {
                    case .success(let response) :
                        callBack(response, nil)
                    case .failure(let e) :
                        callBack(nil, e as NSError)
                    }
                }
            case .resendMsgCode:
                self.network.requestBy(q) { (result: Result<ResendVerifyCode, DataManagerError>) in
                    switch result {
                    case .success(let response) :
                        callBack(response, nil)
                    case .failure(let e) :
                        callBack(nil, e as NSError)
                    }
                }
            case .confirmBindCard:
                self.network.requestBy(q) { (result: Result<ConfirmBindCard, DataManagerError>) in
                    switch result {
                    case .success(let response) :
                        callBack(response, nil)
                    case .failure(let e) :
                        callBack(nil, e as NSError)
                    }
                }
            case .requestCheckPayPassword:
                self.network.requestBy(q) { (result: Result<CheckPayPasswordResponse, DataManagerError>) in
                    switch result {
                    case .success(let response) :
                        callBack(response, nil)
                    case .failure(let e) :
                        callBack(nil, e as NSError)
                    }
                }
            case .requestToPay:
                self.network.requestBy(q) { (result: Result<StartToPayResponse, DataManagerError>) in
                    switch result {
                    case .success(let response) :
                        callBack(response, nil)
                    case .failure(let e) :
                        callBack(nil, e as NSError)
                    }
                }
            case .requestToSurePay:
                self.network.requestBy(q) { (result: Result<SureToPayResponse, DataManagerError>) in
                    switch result {
                    case .success(let response) :
                        callBack(response, nil)
                    case .failure(let e) :
                        callBack(nil, e as NSError)
                    }
                }
            }
        }
    }
}

@objc public enum ObjcCashierRequests: Int {
    case requestInitCashier
    case requestCashierSupportBankCards
    case requestBindCardAndToSupportBankCard
    case requestCheckPayPassword
    case requestToPay
    case requestToSurePay
    case requestBindCardAndCheckCard
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
        return DCCJNetwork.shared.hostMaps[.cashier_staging]!
    }
    
    public var path: String {
        switch self {
        case .send(let type, _):
            switch type {
            case .requestInitCashier:
                return "/bankList"
            case .requestCashierSupportBankCards:
                return "/supportBanks"
            case .requestBindCardAndToSupportBankCard:
                return "/supportedBankCard"
            case .requestCheckPayPassword:
                return "/payPwdCheck"
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

