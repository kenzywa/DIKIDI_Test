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
        VStack(alignment:.leading) {
            Text("Остаток")
                .font(.makeSF(size: 17, fontType: .regular))
            makeTextView(from: dashboardViewModel.dashboardModel?.data.balance)
                .font(.makeSF(size: 30, fontType: .bold))
            HStack {
                DashedUnderlineText(text: "К выплате:")
                Text("100 340.00 Р")
            }
            .font(.makeSF(size: 13, fontType: .regular))
            
            VStack {
                HStack {
                    Text("Переплата")
                        .font(.makeSF(size: 17, fontType: .regular))
                    Image(systemName: "info.circle")
                }
                
                Text("5 000.00 Р").font(.makeSF(size: 20, fontType: .bold))
            }
        
            HStack {
                DashedUnderlineText(text: "К удеражнию:")
                Text("100 340.00 Р")
            }
            .font(.makeSF(size: 13, fontType: .regular))
        }
        .frame(maxWidth:.infinity,maxHeight: .infinity)
        .foregroundColor(.white)
        .background {
            BackgroundSalaryGradientView()
        }
        .onAppear() {
            Task {
                await dashboardViewModel.fetchData()
            }
        }
        
    }
    
    func makeTextView(from string : String?) -> Text {
        guard let string = string else {return Text("")}
        return Text(string)
    }
}

struct BalanceCardView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            VStack(alignment: .leading, spacing: 4) {
                Text("Остаток")
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.8))
                
                HStack(alignment: .firstTextBaseline, spacing: 4) {
                    Text("105 340.00")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(.white)
                    Text("₽")
                        .font(.title2)
                        .foregroundColor(.white)
                }
                
                Text("К выплате: 100 340.00 ₽")
                    .font(.footnote)
                    .foregroundColor(.white.opacity(0.6))
            }

            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 4) {
                    Text("Переплата")
                        .font(.subheadline)
                        .bold()
                        .foregroundColor(.white)
                    Image(systemName: "info.circle")
                        .font(.footnote)
                        .foregroundColor(.white.opacity(0.7))
                }
                
                Text("5 000.00 ₽")
                    .font(.system(size: 18, weight: .bold))
                    .underline()
                    .foregroundColor(.white)
                
                Text("К удержанию: 5 000.00 ₽")
                    .font(.footnote)
                    .foregroundColor(.white.opacity(0.6))
            }
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
//        .padding()
        .background(
            LinearGradient(
                gradient: Gradient(stops: [
                    .init(color: Color.purple.opacity(0.5), location: 0.0),
                    .init(color: Color.blue.opacity(0.4), location: 0.5),
                    .init(color: Color.purple.opacity(0.6), location: 1.0)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing))
        .cornerRadius(16)
        
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
