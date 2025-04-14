//
//  SalaryModel.swift
//  DIKIDI_Test
//
//  Created by Roman Shukailo on 11.04.2025.
//
import Foundation
struct SalaryModel: Codable {
    let error: ErrorModel
    let data : SalaryDataModel
    
}

struct SalaryDataModel : Codable {
    let list: [ListModel]
    let categories: [CategoriesModel]
    
    enum CodingKeys: String, CodingKey {
           case list = "list"
           case categories = "categories"
       }
}

struct ListModel : Codable, Identifiable {
    let id = UUID()
    let apiID : String?
    let employee: EmployeeModel
    let payrollBalanceBegin: String
    let overpaymentBegin: Double?
    let payrollBalanceEnd: String
    let overpaymentEnd: Double?
    let payroll, deduction, paid, payable: String
    let balance: String
    
    enum CodingKeys: String, CodingKey {
        case employee
        case id = "UUID"
        case apiID = "id"
        case payrollBalanceBegin = "payroll_balance_begin"
        case overpaymentBegin = "overpayment_begin"
        case payrollBalanceEnd = "payroll_balance_end"
        case overpaymentEnd = "overpayment_end"
        case payroll, deduction, paid, payable, balance
    }
}

struct EmployeeModel : Codable {
    let id: String
    let icon: String
    let fullname, statusID, statusTitle, categoryID: String
    let categoryTitle: String
    let salarySchemeID : String?
    
    enum CodingKeys: String, CodingKey {
        case id, icon, fullname
        case statusID = "status_id"
        case statusTitle = "status_title"
        case categoryID = "category_id"
        case categoryTitle = "category_title"
        case salarySchemeID = "salary_scheme_id"
    }
}

struct CategoriesModel: Codable {
    let count: Int
    let title, titleMany, id: String
    
    enum CodingKeys: String, CodingKey {
        case count, title
        case titleMany = "title_many"
        case id
    }
}


