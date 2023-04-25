//
//  CategoryViewModel.swift
//  SwiftUIProject
//
//  Created by Vlad Andrieiev on 25.04.2023.
//

import Combine
import SwiftUI

final class CategoryViewModel: ObservableObject {
    @Published var categoryImage: UIImage?

    var categoryName: String {
        category.name
    }

    private let imageLoader: SVGImageLoader = .init()
    private let category: Category

    init(category: Category) {
        self.category = category

        loadImage()
    }

    private func loadImage() {
        imageLoader.loadImage(with: category.image.mediaUrl) { image in
            if let image {
                DispatchQueue.main.async {
                    self.categoryImage = image
                }
            }
        }
    }
}
