//
//  CardsView.swift
//  SwiftUIProject
//
//  Created by Vlad Andrieiev on 19.04.2023.
//

import SwiftUI

struct CardsView: View {
    @StateObject var viewModel = CardsViewModel()

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 24) {
                ForEach(viewModel.vendors, id: \.id) { vendor in
                    
                }
            }
        }
    }
}

struct CardsView_Previews: PreviewProvider {
    static var previews: some View {
        CardsView()
    }
}
