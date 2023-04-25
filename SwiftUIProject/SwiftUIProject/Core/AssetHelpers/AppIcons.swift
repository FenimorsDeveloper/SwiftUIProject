//
//  AppIcons.swift
//  SwiftUIProject
//
//  Created by Vlad Andrieiev on 19.04.2023.
//

import SwiftUI

enum AppIcons: String {
    case icSelectedBookmark = "ic-selected-bookmark"
    case icUnelectedBookmark = "ic-unselected-bookmark"
    case icSearch = "ic-search"

    var icon: Image {
        Image(self.rawValue)
    }
}
