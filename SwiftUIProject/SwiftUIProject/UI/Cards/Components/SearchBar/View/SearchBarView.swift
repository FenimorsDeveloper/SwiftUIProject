//
//  SearchBarView.swift
//  SwiftUIProject
//
//  Created by Vlad Andrieiev on 26.04.2023.
//

import SwiftUI

struct SearchBarView: View {
    @State var text: String

    var body: some View {
        HStack {
            TextField("", text: $text)
                .placeholder(when: text.isEmpty) {
                    Text("Search...")
                        .font(.openSans(.regular, size: 16))
                        .foregroundColor(.resourcesGreySecondary)
                }
                .padding(.leading, 14)

            Spacer()

            AppIcons.icSearch.icon
                .frame(width: 24, height: 24)
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
        }
        .frame(height: 40)
        .background {
            RoundedRectangle(cornerRadius: 16)
                .foregroundColor(.white)
                .shadow(color: .black.opacity(0.05),
                        radius: 7, x: 0, y: 6)
        }
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(text: "")
    }
}
