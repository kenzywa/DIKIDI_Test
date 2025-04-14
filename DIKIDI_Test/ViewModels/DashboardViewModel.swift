//
//  DashboardViewModel.swift
//  DIKIDI_Test
//
//  Created by Roman Shukailo on 11.04.2025.
//
import Foundation

@MainActor
final class DashboardViewModel: ObservableObject {
    @Published var dashboardModel: DashboardModel?

    private let apiManager = APIManager.shared
    
    func fetchData() async {
        do {
            dashboardModel = try await apiManager.fetchDashboardData()
        }catch {
            print(error.localizedDescription)
        }
    }
}
