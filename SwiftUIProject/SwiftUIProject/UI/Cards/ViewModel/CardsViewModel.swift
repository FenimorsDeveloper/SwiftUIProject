//
//  CardsViewModel.swift
//  SwiftUIProject
//
//  Created by Vlad Andrieiev on 19.04.2023.
//

import Combine

final class CardsViewModel: ObservableObject {
    @Published var vendors: [Vendor] = []

    init() {
        
    }
}
