//
//  FOnt.swift
//  DIKIDI_Test
//
//  Created by Roman Shukailo on 14.04.2025.
//

import SwiftUI

extension Font {
    enum FontType : String {
        case bold = "Bold"
        case regular = "Regular"
    }
    
    
    static func makeSF(size: CGFloat,fontType : FontType) -> Font {
        let name = "SFProText-\(fontType.rawValue)"
        print(name)
        return Font.custom(name, size: size)
    }
}
