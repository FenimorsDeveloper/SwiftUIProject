//
//  VendorsInteractor.swift
//  SwiftUIProject
//
//  Created by Vlad Andrieiev on 26.04.2023.
//

protocol VendorsInteractorProtocol {
    func getVendors(with text: String) async -> [Vendor]
}

struct VendorsInteractor: VendorsInteractorProtocol {
    let repository: VendorsRepositoryProtocol = VendorsRepository()

    func getVendors(with text: String) async -> [Vendor] {
        do {
            let vendors = try await repository.getVendors(with: text)
            return vendors
        } catch {
            debugPrint("Failed to fetch all vendors with error \(error.localizedDescription)")
            return []
        }
    }
}
