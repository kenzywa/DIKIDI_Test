//
//  SwipeEmployeeView.swift
//  DIKIDI_Test
//
//  Created by Roman Shukailo on 11.04.2025.
//

import SwiftUI

struct ActionButton: Identifiable {
    let id  = UUID ()
    let systemImage : String
    let tag : Int
}

struct SwipeEmployeeView: View {
    @State private var actionButtons : [ActionButton] = [
        ActionButton(systemImage: "arrow.right.circle",tag: 0),
        ActionButton(systemImage: "minus.circle",tag: 1),
        ActionButton(systemImage: "plus.circle",tag: 2),
        ActionButton(systemImage: "gearshape",tag: 3)
    ]
    
    
    var body: some View {
        HStack {
            ForEach(actionButtons) { actionButton in
                Button {
                    print(actionButton.tag)
                } label: {
                    Image(systemName: actionButton.systemImage)
                        
                }
                .padding(10)
                .tint(.purpleBackground)
                .foregroundColor(.white)
                .border(.white, width: 1)
            }
        }
    }
}

//#Preview {
//    SwipeEmployeeView()
//}
