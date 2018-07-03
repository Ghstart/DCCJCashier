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
    
    public func send(url u: String, method m: Obj_RequestMethods, with d: Dictionary<String, Any> = [:], callBack: @escaping ([String: Any]?, NSError?) -> Void) {
        let r = CashierRequests.request(url: u, method: m.rawValue, data: d)
        _request(q: r, callBack: callBack)
    }
    
    private func _request(q: CashierRequests, callBack: @escaping ([String: Any]?, NSError?) -> Void) {
        let net = DCCJNetwork.shared
        net.delegate    = self
        net.dataSource  = self
        net.requestBy(q) { (data, dataManagerError) in callBack(data, dataManagerError?.error()) }
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

@objc public enum Obj_RequestMethods: Int {
    case GET = 0
    case POST
}

enum CashierRequests {
    case request(url: String, method: Int, data: [String: Any])
}

extension CashierRequests: Request {
    public var path: String {
        switch self {
        case .request(let url, _, _):
            return url
        }
    }
    
    public var method: HTTPMethod {
        switch self {
        case .request(_, let method, _):
            if method == 0 {
                return .GET
            } else {
                return .POST
            }
        }
    }
    
    public var paramters: [String : Any] {
        switch self {
        case .request(_, _, let data):
            return data
        }
    }
}
