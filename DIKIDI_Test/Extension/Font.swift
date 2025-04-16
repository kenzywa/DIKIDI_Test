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
        return Font.custom("SFProText-\(fontType.rawValue)", size: size)
    }
}
