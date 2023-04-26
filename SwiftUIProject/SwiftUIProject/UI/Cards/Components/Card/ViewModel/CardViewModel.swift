//
//  CardViewModel.swift
//  SwiftUIProject
//
//  Created by Vlad Andrieiev on 19.04.2023.
//

import Combine
import SwiftUI

final class CardViewModel: ObservableObject {

    @Published var isFavorited: Bool
    @Published var showImageCover: Bool = false

    var coverPhotoUrl: URL {
        vendor.coverPhoto.mediaUrl
    }

    var bookmarkIcon: Image {
        isFavorited ? AppIcons.icSelectedBookmark.icon : AppIcons.icUnelectedBookmark.icon
    }

    var areaServed: String {
        vendor.areaServed
    }

    var name: String {
        vendor.companyName
    }

    var categories: [Category] {
        vendor.categories
    }

    var tags: [Tag] {
        vendor.tags
    }

    private let vendor: Vendor

    init(vendor: Vendor) {
        self.vendor = vendor
        self.isFavorited = vendor.favorited
    }

    func onBookmark() {
        isFavorited.toggle()
    }

    func imageLoaded() {
        showImageCover.toggle()
    }
}
