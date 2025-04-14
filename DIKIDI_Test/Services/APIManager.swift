//
//  APIManager.swift
//  DIKIDI_Test
//
//  Created by Roman Shukailo on 11.04.2025.
//
import Foundation

final class APIManager {
    static let shared = APIManager()
    
    private init() {}
    
    func fetchDashboardData() async throws -> DashboardModel? {
        guard let url = Bundle.main.url(forResource: "dashboard", withExtension: "json") else {return nil}
        do {
            let data = try Data(contentsOf: url)
            let jsonDecoder = JSONDecoder()
            let model = try jsonDecoder.decode(DashboardModel.self, from: data)
            return model
        }catch {
            throw APIError.decodingFailed
        }
    }
    
    func fetchSalaryData() async throws -> SalaryModel? {
        guard let url = Bundle.main.url(forResource: "salary", withExtension: "json") else {return nil}
        do {
            let data = try Data(contentsOf: url)
            let jsonDecoder = JSONDecoder()
            let model = try jsonDecoder.decode(SalaryModel.self, from: data)
            return model
        }catch let error {
            print(error)
            throw APIError.decodingFailed
        }
    }
}

enum Jsons : String {
    case dashboard = "dashboard"
    case salary = "salary"
}


enum APIError: Error {
    case decodingFailed
    case invalidResponse
    
}
