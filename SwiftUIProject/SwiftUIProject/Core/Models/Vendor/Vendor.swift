//
//  Vendor.swift
//  SwiftUIProject
//
//  Created by Vlad Andrieiev on 19.04.2023.
//

import Foundation

struct Vendor {
    let id: Int64
    let companyName: String
    let areaServed: String
    let shopType: String
    let favorited: Bool
    let follow: Bool
    let businessType: String
    let coverPhoto: Media
    let categories: [Category]
    let tags: [Tag]

    static var mock: Vendor {
        .init(id: 99,
              companyName: "Florists + Fashion",
              areaServed: "Newry",
              shopType: "Bike Shop",
              favorited: false,
              follow: false,
              businessType: "virtual",
              coverPhoto: .init(id: 984,
                                mediaUrl: URL(string: "https://cdn-staging.chatsumer.app/eyJidWNrZXQiOiJjaGF0c3VtZXItZ2VuZXJhbC1zdGFnaW5nLXN0b3JhZ2UiLCJrZXkiOiIxMy84ZjMzZTgyNy0yNzIxLTQ3ZjctYjViNS0zM2Q5Y2E2MTM1OGQuanBlZyJ9")!,
                                mediaType: .image),
              categories: [
                .init(id: 40,
                      name: "Florists",
                      image: .init(id: 1348,
                                   mediaUrl: URL(string: "https://media-staging.chatsumer.app/48/1830f855-6315-4d3c-a5dc-088ea826aef2.svg")!,
                                   mediaType: .image)),
                .init(id: 41,
                      name: "Fashion Accessories",
                      image: .init(id: 1366,
                                   mediaUrl: URL(string: "https://media-staging.chatsumer.app/48/1830f855-6315-4d3c-a5dc-088ea826aef2.svg")!,
                                   mediaType: .image)),
                .init(id: 42,
                      name: "Home",
                      image: .init(id: 1348,
                                   mediaUrl: URL(string: "https://media-staging.chatsumer.app/48/1830f855-6315-4d3c-a5dc-088ea826aef2.svg")!,
                                   mediaType: .image)),
                .init(id: 43,
                      name: "Garden",
                      image: .init(id: 1366,
                                   mediaUrl: URL(string: "https://media-staging.chatsumer.app/48/1830f855-6315-4d3c-a5dc-088ea826aef2.svg")!,
                                   mediaType: .image))
              ],
              tags: [
                .init(id: 99,
                      name: "Giant",
                      purpose: "shop"),
                .init(id: 100,
                      name: "BMX",
                      purpose: "shop"),
                .init(id: 101,
                      name: "Cycle",
                      purpose: "shop"),
                .init(id: 102,
                      name: "BMX",
                      purpose: "shop"),
                .init(id: 103,
                      name: "Giant",
                      purpose: "shop"),
                .init(id: 104,
                      name: "Cycle",
                      purpose: "shop")
              ])
    }
}

struct Media {
    let id: Int64
    let mediaUrl: URL
    let mediaType: MediaType
}

enum MediaType {
    case image
}

struct Category {
    let id: Int64
    let name: String
    let image: Media
}

struct Tag {
    let id: Int64
    let name: String
    let purpose: String
}