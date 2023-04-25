//
//  VendorsInteractor.swift
//  SwiftUIProject
//
//  Created by Vlad Andrieiev on 26.04.2023.
//

protocol VendorsInteractorProtocol {
    func getAll() async -> [Vendor]
}

struct VendorsInteractor: VendorsInteractorProtocol {
    let repository: VendorsRepositoryProtocol = VendorsRepository()

    func getAll() async -> [Vendor] {
        do {
            let vendors = try await repository.getAll()
            return vendors
        } catch {
            debugPrint("Failed to fetch all vendors with error \(error.localizedDescription)")
            return []
        }
    }
}
