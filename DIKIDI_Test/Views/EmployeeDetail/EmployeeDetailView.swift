//
//  EmployeeDetailView.swift
//  DIKIDI_Test
//
//  Created by Roman Shukailo on 14.04.2025.
//

import SwiftUI

struct EmployeeDetailView: View {
    var listModel : ListModel
    var body: some View {
        VStack {
            Text(listModel.employee.fullname)
        }
        .navigationTitle("Сотрудник")
        .navigationBarTitleDisplayMode(.inline)
    }
}

//#Preview {
//    EmployeeDetailView()
//}
