//
//  ContentView.swift
//  SwiftUIProject
//
//  Created by Vlad Andrieiev on 19.04.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CardView(vendor: .mock)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
