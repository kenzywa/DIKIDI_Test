//
//  MoneyView.swift
//  DIKIDI_Test
//
//  Created by Roman Shukailo on 10.04.2025.
//

import SwiftUI



struct FinanceView: View {
    @StateObject private var salaryViewModel = SalaryViewModel()
    
    @State var selectedTitleOnPicker: String = "Остаток"
    
    
    @State var isShowTip: Bool = false
    
    @State private var pickerTitles: [String] = ["Остаток","Расчёты","Операции"]
    @State private var periods: [String] = ["За месяц","За год"]
    
    var body: some View {
        NavigationStack{
            ZStack {
                BackgroundGradientView().ignoresSafeArea(.all)
                VStack(alignment: .leading) {
                    TipView(isShowTip: $isShowTip)
                    //MARK: - DataPicker
                    PickersView()
                        .frame(maxWidth: 374,maxHeight: 44)
                    //MARK: - Dashboard
                    DashboardView()
                        .frame(maxWidth: 374,maxHeight: 180)
                        .padding(10)
                    SectionView()
                        .frame(maxWidth: 374,maxHeight: 20)
                    //MARK: - List
                        List(salaryViewModel.list) { listModel in
                            EmployeeCell(listModel: listModel)
                                .swipeActions(edge: .trailing) {
                                    SwipeEmployeeView()
                                }
                                .listRowSeparator(.hidden)
                        }
                        
                        .listStyle(.sidebar)
                        .scrollContentBackground(.hidden)
                        .onAppear() {
                            Task {
                                await salaryViewModel.fetchData()
                            }
                        }
                        .frame(maxWidth:400,maxHeight: 415)
                }
            }
        }
        .toolbarBackground(.hidden, for: .navigationBar)
        .toolbar {
            //MARK: - NavigationBar
            ToolbarItem(placement: .topBarTrailing) {
                HStack(alignment:.center,spacing: 2) {
                    Picker("", selection: $selectedTitleOnPicker) {
                        ForEach(pickerTitles,id: \.self) { name in
                            Text(name)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    
                    Button(action: {
                        isShowTip.toggle()
                    }) {
                        Image(systemName: "questionmark.circle")
                    }
                    
                    NavigationLink(destination: SettingsView()) {
                        Image(systemName: "gearshape")
                    }
                }
            }
        }
    }
    
}

struct SectionView : View {
    enum SortType: String, CaseIterable {
        case nameUp = "Алфавитно (А-Я)"
        case nameDown = "Алфавитно (Я-А)"
        case balanceUp = "По балансу (возрастание)"
        case balanceDown = "По балансу (по убыванию)"
    }
    
    @State var sortType: SortType = .nameUp
    var body: some View {
        HStack {
            Text("Сотрудники".uppercased())
                .foregroundColor(.white.opacity(0.6))
            
            Spacer()
            
//            Picker("", systemImage: "line.3.horizontal.decrease.circle", selection: $sortType) {
//                ForEach(SortType.allCases,id: \.self) { sortType in
//                    Text(sortType.rawValue).font(.system(size: 17))
//                }
//            }
            
            Button {
                print("sort")
            } label: {
                Image(systemName: "line.3.horizontal.decrease.circle")
                    .imageScale(.large)
            }
        }
        .background(.clear)
        .padding(.leading,20)
    }
}

struct TipView : View {
    @Binding var isShowTip : Bool
    var body: some View {
        VStack {
            Text("Здесь текст подсказки").foregroundColor(.white)
                .padding()
        }
        .background {
            RoundedRectangle(cornerRadius: 5).fill(.gray.opacity(0.2))
        }
        .frame(width: isShowTip ? nil : 0, height: isShowTip ? nil : 0)
        .opacity(isShowTip ? 1 : 0)
        .onTapGesture {
            isShowTip.toggle()
        }
    }
}

struct PickersView : View {
    @State private var pickerDates : [String] = ["На текущий момент", "К дате", "За период"]
    @State var selectedDateOnPicker: String = "На текущий момент"
    @State private var selectedDate = Date()
    var body : some View {
        HStack() {
            
            Picker("", selection: $selectedDateOnPicker) {
                ForEach(pickerDates,id: \.self) { name in
                    Text(name).font(.system(size: 17))
                }
            }
            .pickerStyle(.menu)
            .frame(maxWidth: .infinity)
            
            
            //            Spacer()
            
            DatePicker("", selection: $selectedDate, displayedComponents: .date)
                .pickerStyle(.automatic)
                .foregroundColor(.white)
                .background(.clear)
                .environment(\.locale, Locale.current)
        }
    }
    
    func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru_RU") // Русская локаль
        formatter.dateFormat = "d MMMM" // Без года
        return formatter.string(from: date)
    }
}



//MARK: - Background Gradient

struct BackgroundGradientView : View {
    var body: some View {
        Rectangle().fill( LinearGradient(stops: [
            .init(color: Color.purpleBackground, location: 0.0),
            .init(color: Color.whiteBackground, location: 0.7)],
                                         startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1)))
        
    }
}
