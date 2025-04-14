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
        HStack(alignment:.center){
            HStack(alignment:.center,spacing: 10) {
                AvatarView(stringUrl: listModel.employee.icon)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
                    .frame(maxWidth: 36, maxHeight: 36)
                InformationEmployeeView(listModel: listModel)
            }
            Spacer()
            
            SalaryEmployeeView(listModel: listModel)
            }
    }
}

//MARK: - AvatarView
struct AvatarView: View {
    var stringUrl: String
    var body: some View {
        if let url = URL(string: stringUrl) {
            AsyncImage(url: url) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
        }else {
            Image(systemName: "photo")
        }
    }
       
}
//MARK: - InformationEmployeeView
struct InformationEmployeeView : View {
    var listModel : ListModel
    var body: some View {
        VStack(alignment: .listRowSeparatorLeading) {
            Text(listModel.employee.fullname)
                .truncationMode(.tail)
                .lineLimit(1)
                .foregroundColor(.black)
            Text(listModel.employee.categoryTitle)
                .foregroundColor(.gray)
                .truncationMode(.tail)
                .lineLimit(1)
        }
        .frame(maxWidth: 130)
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
                        }
                    }
                }else {
                    makeTextBalance(from: listModel.balance)
                }
            }else {
               Text("Нет схемы оплаты")
                    .foregroundColor(.red)
                    .font(.system(size: 13))
            }
        }
    }
    
    func makeTextBalance(from string: String) -> Text {
        guard let number = Double(string) else {
            return Text("Ошибка баланса").foregroundColor(.green)
        }
        if number >= 0 {
            return Text("\(number)".addRubleSign()).foregroundColor(Color.purpleBackground)
        }else {
            return Text("\(number)".addRubleSign()).foregroundColor(.red)
        }
        
    }
}

//#Preview {
//    EmployeeCell()
//}
