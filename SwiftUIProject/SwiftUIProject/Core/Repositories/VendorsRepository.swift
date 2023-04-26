//
//  VendorsRepository.swift
//  SwiftUIProject
//
//  Created by Vlad Andrieiev on 26.04.2023.
//

import Foundation

protocol VendorsRepositoryProtocol {
    func getVendors(with text: String) async throws -> [Vendor]
}

struct VendorsRepository: VendorsRepositoryProtocol {

    func getVendors(with text: String) async throws -> [Vendor] {
        try await mockData(with: text)
    }

    private func mockData(with text: String) async throws -> [Vendor] {
        try await Task.sleep(nanoseconds: 1_000_000_000)

        let vendors = VendorMockData().getVendors()

        return text.isEmpty ? vendors : vendors.filter { $0.companyName.lowercased().contains(text.lowercased()) }
    }
}
