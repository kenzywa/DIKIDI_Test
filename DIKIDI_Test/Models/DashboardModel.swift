//
//  DashboardModel.swift
//  DIKIDI_Test
//
//  Created by Roman Shukailo on 11.04.2025.
//
import Foundation

struct DashboardModel: Codable {
    let error: ErrorModel
    let data: DataModel
}

struct ErrorModel: Codable {
    let code: Int
    let message: String?
}

struct DataModel: Codable {
    let payrollBalanceBegin: String
    let overpaymentBegin: Double?
    let payrollBalanceEnd: String
    let overpaymentEnd: Double?
    let payroll, deduction, paid, balance: String
    let payable: Double?
    
    enum CodingKeys: String, CodingKey {
        case payrollBalanceBegin = "payroll_balance_begin"
        case overpaymentBegin = "overpayment_begin"
        case payrollBalanceEnd = "payroll_balance_end"
        case overpaymentEnd = "overpayment_end"
        case payroll, deduction, paid, balance, payable
    }
}



