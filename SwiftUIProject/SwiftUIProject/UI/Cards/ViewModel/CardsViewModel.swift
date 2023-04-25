//
//  CardsViewModel.swift
//  SwiftUIProject
//
//  Created by Vlad Andrieiev on 19.04.2023.
//

import Combine
import Foundation

final class CardsViewModel: ObservableObject {
    @Published var text: String = ""
    @Published var vendors: [Vendor] = []

    private let vendorsInteractor: VendorsInteractorProtocol = VendorsInteractor()

    init() {
        loadData()
    }

    func loadData() {
        Task {
            let vendors = await vendorsInteractor.getAll()

            DispatchQueue.main.async {
                self.vendors = vendors
            }
        }
    }
}
