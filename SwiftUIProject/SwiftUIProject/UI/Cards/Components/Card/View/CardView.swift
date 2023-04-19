//
//  CardView.swift
//  SwiftUIProject
//
//  Created by Vlad Andrieiev on 19.04.2023.
//

import SwiftUI

struct CardView: View {
    @StateObject private var viewModel: CardViewModel

    init(vendor: Vendor) {
        self._viewModel = .init(wrappedValue: .init(vendor: vendor))
    }

    var body: some View {
        VStack(spacing: .zero) {
            coverPhoto
                .overlay(coverPhotoOverlay)

            Spacer()
                .frame(height: 10)

            namePosition

            categories
        }
    }

    private var coverPhoto: some View {
        AsyncImage(url: viewModel.coverPhotoUrl) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                    .overlay(gradient)
                    .shadow(color: .black.opacity(0.05), radius: 15, x: 0, y: 10)
            case .failure(let error):
                Text("Failed to load image: \(error.localizedDescription)")
            @unknown default:
                fatalError("Unexpected AsyncImagePhase case")
            }
        }
    }

    private var gradient: some View {
        LinearGradient(
            gradient: Gradient(
                stops: [
                    .init(color: Color(red: 0.196, green: 0.196, blue: 0.196, opacity: 0), location: 0.6),
                    .init(color: Color(red: 0.075, green: 0.075, blue: 0.075), location: 1)
                ]
            ),
            startPoint: .top,
            endPoint: .bottom
        )
        .cornerRadius(10)
    }

    private var coverPhotoOverlay: some View {
        VStack {
            bookmarkButtonPosition
            Spacer()
            areaServedPosition
        }
    }

    private var bookmarkButtonPosition: some View {
        HStack {
            Spacer()
            bookmarkButton
        }
        .padding(.all, 10)
    }

    private var bookmarkButton: some View {
        Button(action: viewModel.onBookmark) {
            Circle()
                .foregroundColor(viewModel.isFavorited ? .resourcesDarkGreen : .white)
                .frame(width: 36, height: 36)
                .overlay(viewModel.bookmarkIcon)
        }
    }

    private var areaServedPosition: some View {
        HStack {
            areaServed
            Spacer()
        }
        .padding(.all, 8)
    }

    private var areaServed: some View {
        Text(viewModel.areaServed)
            .foregroundColor(.resourcesGreyPrimary)
            .font(.openSans(.regular, size: 14))
            .padding(.horizontal, 8)
            .padding(.vertical, 2)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .foregroundColor(.white.opacity(0.9))
            )
    }

    private var namePosition: some View {
        HStack {
            name
            Spacer()
        }
    }

    private var name: some View {
        Text(viewModel.name)
            .foregroundColor(.resourcesGreyPrimary)
            .font(.openSans(.bold, size: 16))
    }

    private var categories: some View {
        Spacer()
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(vendor: .mock)
    }
}
