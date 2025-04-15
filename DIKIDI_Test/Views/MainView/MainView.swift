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
                NavigationLink("Перейти на тестовый экран", destination: FinanceView())
                    .foregroundColor(.black)
                    .font(.makeSF(size: 20, fontType: .bold))
        }
        .accentColor(.white)
    }
}

//#Preview {
//    MainView()
//}
