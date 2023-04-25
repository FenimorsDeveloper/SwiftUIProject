//
//  TagViewModel.swift
//  SwiftUIProject
//
//  Created by Vlad Andrieiev on 26.04.2023.
//

import Combine

final class TagViewModel: ObservableObject {

    var name: String {
        tag.name
    }
    
    private let tag: Tag

    init(tag: Tag) {
        self.tag = tag
    }
}
