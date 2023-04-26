//
//  Vendor.swift
//  SwiftUIProject
//
//  Created by Vlad Andrieiev on 19.04.2023.
//

import Foundation

struct Vendor {
    let id: UUID
    let companyName: String
    let areaServed: String
    let shopType: String
    let favorited: Bool
    let follow: Bool
    let businessType: String
    let coverPhoto: Media
    let categories: [Category]
    let tags: [Tag]
}

struct Media: Hashable {
    let id: Int64
    let mediaUrl: URL
    let mediaType: MediaType
}

enum MediaType {
    case image
}

struct Category: Hashable {
    let id: Int64
    let name: String
    let image: Media

    static var mock: Category {
        .init(id: 40,
              name: "Florists",
              image: .init(id: 1348,
                           mediaUrl: URL(string: "https://media-staging.chatsumer.app/48/1830f855-6315-4d3c-a5dc-088ea826aef2.svg")!,
                           mediaType: .image))
    }
}

struct Tag: Hashable {
    let id: Int64
    let name: String
    let purpose: String

    static var mock: Tag {
        .init(id: 99,
              name: "Giant",
              purpose: "shop")
    }
}
