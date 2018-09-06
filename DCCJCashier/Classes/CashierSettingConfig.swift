//
//  CashierSettingConfig.swift
//  DCCJCashier
//
//  Created by 龚欢 on 2018/7/27.
//

import Foundation

public enum CashierPages {
    case bankCardLists
}

public enum CashierRequestTypes {
    case requestInitCashier                 // 初始化收银台获取银行卡列表
    case requestBankCardsList               // 我的银行卡列表
    case supportBankCards                   // 支持银行卡列表
    case requestCheckPayPassword            // 检查支付密码
    case requestToPay                       // 发起支付
    case requestToSurePay                   // 确认支付
    case requestBindCardAndCheckCard        // 单独绑卡并检查银行卡号
    case requestBindCardAndConfirm          // 单独绑卡并确认
    case closeCashier                       // 关闭收银台
    case checkBankCardBin                   // 检查银行卡bin
}
