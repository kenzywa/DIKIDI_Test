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
                    switch actionButton.tag {
                    case 0 :
                        print("next")
                    case 1:
                        print("delete")
                    case 2:
                        print("add")
                    case 3:
                        print("fix")
                    default:
                        print("default")
                    }
                } label: {
                    Image(systemName: actionButton.systemImage)
                    
                }
                .tint(.blueBackground)
                .foregroundColor(.white)
                .frame(maxWidth: 22)
            }
        }
    }
}

//#Preview {
//    SwipeEmployeeView()
//}
