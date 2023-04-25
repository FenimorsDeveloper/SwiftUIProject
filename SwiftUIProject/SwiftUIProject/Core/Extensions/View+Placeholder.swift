//
//  View+Placeholder.swift
//  SwiftUIProject
//
//  Created by Vlad Andrieiev on 26.04.2023.
//

import SwiftUI

extension View {
    func placeholder<Content: View>(when shouldShow: Bool,
                                    alignment: Alignment = .leading,
                                    @ViewBuilder placeholder: () -> Content) -> some View {
        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
