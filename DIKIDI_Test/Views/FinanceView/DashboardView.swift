//
//  ReportView.swift
//  DIKIDI_Test
//
//  Created by Roman Shukailo on 11.04.2025.
//

import SwiftUI

struct DashboardView: View {
    @StateObject private var dashboardViewModel = DashboardViewModel()
    var body: some View {
        VStack(alignment:.leading,spacing: 10) {
            BalanceView(dashboardViewModel: dashboardViewModel)
            OverPayView()
        }
        .padding(.vertical)
        .padding(.horizontal)
        .frame(maxWidth:.infinity,maxHeight: .infinity)
        .foregroundColor(.white)
        .background {
            BackgroundSalaryGradientView()
//                .blur(radius: 5).opacity(0.5)
        }
        .onAppear() {
            Task {
                await dashboardViewModel.fetchData()
            }
        }
        
    }
}


struct BalanceView : View {
    @ObservedObject var dashboardViewModel: DashboardViewModel
    var body: some View {
        VStack(alignment: .leading,spacing:5) {
            Text("Остаток")
                .font(.makeSF(size: 17, fontType: .regular))
            if let text = dashboardViewModel.dashboardModel?.data.balance {
                Text(text.addRubleSign())
                    .font(.makeSF(size: 30, fontType: .bold))
            }else {
                Text("")
            }
            
            HStack {
                DashedUnderlineText(text: "К выплате:")
                Text("100 340.00".addRubleSign())
                Spacer()
            }
            .font(.makeSF(size: 13, fontType: .regular))
            .frame(maxWidth:.infinity,maxHeight: .infinity)
        }
    }
}

struct OverPayView : View {
    var body: some View {
        VStack {
            HStack {
                Text("Переплата")
                    .font(.makeSF(size: 17, fontType: .regular))
                Image(systemName: "info.circle")
                    .onTapGesture {
                        print("info tapped")
                    }
                Spacer()
            }
            .frame(maxWidth:.infinity,maxHeight: .infinity)
            
            HStack {
                Text("5 000.00".addRubleSign()).font(.makeSF(size: 20, fontType: .bold))
                Spacer()
            }
            .frame(maxWidth:.infinity,maxHeight: .infinity)
            
            HStack {
                DashedUnderlineText(text: "К удеражнию:")
                Text("100 340.00".addRubleSign())
                Spacer()
            }
            .font(.makeSF(size: 13, fontType: .regular))
            .frame(maxWidth:.infinity,maxHeight: .infinity)
        }
        .frame(maxWidth:.infinity,maxHeight: .infinity)
    }
}

struct BackgroundSalaryGradientView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10).fill(LinearGradient(stops: [
            .init(color: Color.firstGradientColor, location: 0.0),
            .init(color: Color.purpleBackground, location: 0.2),
            .init(color: Color.lastGradientColor, location: 1.0)],
                                                               startPoint: UnitPoint(x: 0, y: 1), endPoint: UnitPoint(x: 1, y: 0)))
    }
}

struct DashedUnderlineText: View {
    var text: String
    var body: some View {
        Text(text)
            .background(
                DashedUnderline()
                    .stroke(style: StrokeStyle(lineWidth: 1, dash: [2, 1]))
                    .foregroundColor(.white)
                    .offset(y: 1)
            )
    }
}

struct DashedUnderline: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let y = rect.maxY
        path.move(to: CGPoint(x: 0, y: y))
        path.addLine(to: CGPoint(x: rect.width, y: y))
        return path
    }
}



//#Preview {
//    DashboardView()
//}
