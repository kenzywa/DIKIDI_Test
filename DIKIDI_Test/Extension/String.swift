//
//  String.swift
//  DIKIDI_Test
//
//  Created by Roman Shukailo on 14.04.2025.
//
import Foundation


extension String {
    func addRubleSign() -> String {
        self + " ₽"
    }
    
    func separateThousand() -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = " " // Используем пробел для разделения тысяч
//        formatter.minimumFractionDigits = 2
//        formatter.maximumFractionDigits = 2
        
        if let number = formatter.number(from: self) {
            return formatter.string(from: number)
        }
        return nil
    }
}
