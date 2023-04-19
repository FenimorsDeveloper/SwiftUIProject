//
//  Font+OpenSans.swift
//  SwiftUIProject
//
//  Created by Vlad Andrieiev on 19.04.2023.
//

import SwiftUI

extension Font {
    enum OpenSans: String {
        case bold = "OpenSans-Bold"
        case boldItalic = "OpenSans-BoldItalic"
        case extraBold = "OpenSans-ExtraBold"
        case extraBoldItalic = "OpenSans-ExtraBoldItalic"
        case italic = "OpenSans-Italic"
        case light = "OpenSans-Light"
        case lightItalic = "OpenSans-LightItalic"
        case medium = "OpenSans-Medium"
        case mediumItalic = "OpenSans-MediumItalic"
        case regular = "OpenSans-Regular"
        case semiBold = "OpenSans-SemiBold"
        case semiBoldItalic = "OpenSans-SemiBoldItalic"
    }

    static func openSans(_ type: OpenSans, size: CGFloat = 16) -> Font {
        .custom(type.rawValue, size: size)
    }
}
