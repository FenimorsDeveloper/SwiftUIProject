//
//  TagView.swift
//  SwiftUIProject
//
//  Created by Vlad Andrieiev on 26.04.2023.
//

import SwiftUI

struct TagView: View {

    @StateObject var viewModel: TagViewModel

    init(tag: Tag) {
        self._viewModel = .init(wrappedValue: .init(tag: tag))
    }

    var body: some View {
        Text("• \(viewModel.name)")
            .foregroundColor(.resourcesGreySecondary)
            .font(.openSans(.regular, size: 14))
            .frame(height: 18)
    }
}

struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        TagView(tag: .mock)
    }
}
