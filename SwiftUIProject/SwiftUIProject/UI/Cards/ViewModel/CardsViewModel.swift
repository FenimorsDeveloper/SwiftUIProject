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

    private var cancellables: [AnyCancellable] = []

    private let vendorsInteractor: VendorsInteractorProtocol = VendorsInteractor()

    init() {
        loadData()
        setupBindings()
    }

    func loadData() {
        Task {
            let vendors = await vendorsInteractor.getVendors(with: text)

            DispatchQueue.main.async {
                self.vendors.append(contentsOf: vendors)
            }
        }
    }

    func onAppearCardView(with index: Int) {
        if vendors.count - index < 3 {
            loadData()
        }
    }

    private func setupBindings() {
        $text
            .sink { [weak self] text in
                if text.count > 2 {
                    self?.filteredLoadData()
                }
            }
            .store(in: &cancellables)
    }

    private func filteredLoadData() {
        Task {
            let vendors = await vendorsInteractor.getVendors(with: text)

            DispatchQueue.main.async {
                self.vendors = vendors
            }
        }
    }
}
