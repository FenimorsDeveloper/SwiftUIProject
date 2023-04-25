//
//  VendorsRepository.swift
//  SwiftUIProject
//
//  Created by Vlad Andrieiev on 26.04.2023.
//

import Foundation

protocol VendorsRepositoryProtocol {
    func getAll() async throws -> [Vendor]
}

struct VendorsRepository: VendorsRepositoryProtocol {

    func getAll() async throws -> [Vendor] {
        try await mockData()
    }

    private func mockData() async throws -> [Vendor] {
        try await Task.sleep(nanoseconds: 1_000_000_000)

        return Vendor.mockArray
    }
}
