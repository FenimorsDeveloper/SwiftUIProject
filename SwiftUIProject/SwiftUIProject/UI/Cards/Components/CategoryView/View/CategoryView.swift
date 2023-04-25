//
//  CategoryView.swift
//  SwiftUIProject
//
//  Created by Vlad Andrieiev on 25.04.2023.
//

import SwiftUI

struct CategoryView: View {
    @StateObject var viewModel: CategoryViewModel

    init(category: Category) {
        self._viewModel = .init(wrappedValue: .init(category: category))
    }

    var body: some View {
        HStack(spacing: 6) {
            if let image = viewModel.categoryImage {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 22, height: 22)
            } else {
                Spacer()
                    .frame(width: 22)
            }
            

            Text(viewModel.categoryName)
                .foregroundColor(.resourcesGreyPrimary)
                .font(.openSans(.regular, size: 14))
        }
        .frame(height: 22)
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(category: .mock)
    }
}
