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
        ZStack {
            Color.whiteBackground
            Text(listModel.employee.fullname)
        }
        .navigationTitle("Сотрудник")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(false)
    }
}

//#Preview {
//    EmployeeDetailView()
//}
