//
//  MainView.swift
//  DIKIDI_Test
//
//  Created by Roman Shukailo on 10.04.2025.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            NavigationLink("Перейти на тестовый экран", destination: FinanceView().toolbarRole(.editor))
                .foregroundColor(.black)
        }
        .accentColor(.white)
    }
}

//#Preview {
//    MainView()
//}
