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
    
    public let network: DCCJNetwork = DCCJNetwork.shared
    private lazy var cashierUI: DCCJCashierUIManager = DCCJCashierUIManager()
    
    public override init() {
        super.init()
    }
    
    public func navigator(page: CashierPages, on nav: UINavigationController? = nil) {
        return self.cashierUI.uiManagerNavigator(page: page, on: nav)
    }
    
    public func present(page: CashierPages, on vc: UIViewController) {
        self.cashierUI.uiManagerPresent(page: page, on: vc)
    }

    public func request<D: Codable>(_ r: CashierRequests, handler: @escaping (Result<D, NSError>) -> Void) -> URLSessionDataTask? {
        return self.network.requestBy(r, completion: { (result: Result<D, DataManagerError>) in
            switch result {
            case .success(let v):
                handler(.success(v))
            case .failure(let e as NSError):
                handler(.failure(e))
            }
        })
    }
    /*
    public func request<Value: Codable>(_ r: CashierRequests, handler: @escaping (Value?, DataManagerError?) -> Void) {
        
        self.network.requestBy(r) {  (result: Result<Value, DataManagerError>) in
            switch result {
            case .success(let response) :
                handler(response, nil)
            case .failure(let e) :
                handler(nil, e)
            }
        }
    }
    */
    
    /*
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
    */
}

public enum CashierRequests {
    case send(type: CashierRequestTypes, data: [String: Any])
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

