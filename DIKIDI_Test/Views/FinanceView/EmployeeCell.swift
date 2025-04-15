//
//  EmployeeCell.swift
//  DIKIDI_Test
//
//  Created by Roman Shukailo on 11.04.2025.
//

import SwiftUI

struct EmployeeCell: View {
    let listModel: ListModel
    var body: some View {
        HStack(alignment:.center) {
            AvatarView(stringUrl: listModel.employee.icon)
                .clipShape(RoundedRectangle(cornerRadius: 6))
                .frame(width:36,height:36)
                .padding(5)
            InformationEmployeeView(listModel: listModel)
                .layoutPriority(1)
            
            Spacer(minLength: 0)
            SalaryEmployeeView(listModel: listModel)
                .frame(width:105)
        }
    }
}

//MARK: - AvatarView
struct AvatarView: View {
    var stringUrl: String
    var body: some View {
        if let url = URL(string: stringUrl) {
            AsyncImage(url: url) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(maxWidth: 36, maxHeight: 36)
                case .success(let image):
                    image.resizable()
                        .frame(maxWidth: 36, maxHeight: 36)
                case .failure:
                    Image(systemName: "photo")
                        .frame(maxWidth: 36, maxHeight: 36)
                @unknown default:
                    EmptyView()
                        .frame(maxWidth: 36, maxHeight: 36)
                }
            }
        }else {
            Image(systemName: "photo")
                .frame(maxWidth: 36, maxHeight: 36)
        }
    }
}
//MARK: - InformationEmployeeView
struct InformationEmployeeView : View {
    var listModel : ListModel
    var body: some View {
        VStack(alignment: .listRowSeparatorLeading,spacing:2) {
            Text(listModel.employee.fullname)
                .truncationMode(.tail)
                .lineLimit(1)
                .foregroundColor(.black)
                .font(.makeSF(size: 15, fontType: .regular))
            Text(listModel.employee.categoryTitle)
                .foregroundColor(.gray)
                .truncationMode(.tail)
                .lineLimit(1)
                .font(.makeSF(size: 13, fontType: .regular))
        }
    }
}
//MARK: - SalaryEmployeeView
struct SalaryEmployeeView: View {
    var listModel : ListModel
    var body: some View {
        VStack {
            if listModel.employee.salarySchemeID != nil {
                if let overPaymentEnd = listModel.overpaymentEnd,let overpaymentBegin = listModel.overpaymentBegin {
                    let overPayment = overPaymentEnd - overpaymentBegin
                    if overPayment > 0 {
                        VStack {
                            makeTextBalance(from: listModel.balance)
                            Text("Переплата: \(overPayment)".addRubleSign())
                                .foregroundColor(.red)
                                .font(.makeSF(size: 13, fontType: .regular))
                        }
                    }else {
                        Text("").opacity(0)
                    }
                }else {
                    makeTextBalance(from: listModel.balance)
                }
            }else {
                Text("Нет схемы зарплаты")
                    .foregroundColor(.orange)
                    .font(.makeSF(size: 13, fontType: .regular))
            }
        }
    }
    
    func makeTextBalance(from string: String) -> Text {
        guard let number = Double(string) else {
            return Text("Ошибка баланса").foregroundColor(.green)
        }
        if number >= 0 {
            return Text("\(number)".makeThousand().addRubleSign()).foregroundColor(Color.purpleBackground)
                .font(.makeSF(size: 15, fontType: .regular))
        }else {
            return Text("\(number)".makeThousand().addRubleSign()).foregroundColor(.red)
                .font(.makeSF(size: 15, fontType: .regular))
        }
        
    }
}

//#Preview {
//    EmployeeCell()
//}
