//
//  SalaryViewModel.swift
//  DIKIDI_Test
//
//  Created by Roman Shukailo on 11.04.2025.
//

import Foundation

@MainActor
final class SalaryViewModel: ObservableObject {
    @Published var salaryModel: SalaryModel?
    @Published var list: [ListModel] = []
    
    private let apiManager = APIManager.shared
    
    func fetchData() async {
        do {
            salaryModel = try await apiManager.fetchSalaryData()
            guard let newList = salaryModel?.data.list else {return}
            list = newList
        }catch {
            print(error.localizedDescription)
        }
    }
    
}

