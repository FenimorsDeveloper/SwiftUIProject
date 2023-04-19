//
//  FlexibleView.swift
//  SwiftUIProject
//
//  Created by Vlad Andrieiev on 20.04.2023.
//

import SwiftUI

struct FlexibleView<Data: Collection, Content: View>: View where Data.Element: Hashable {
    @State var elementsSize: [Data.Element: CGSize] = [:]

    let availableWidth: CGFloat
    let data: Data
    let spacing: CGFloat
    let alignment: HorizontalAlignment
    let content: (Data.Element) -> Content

    var body: some View {
        VStack(alignment: alignment, spacing: spacing) {
            ForEach(computeRows(), id: \.self) { rowElements in
                HStack(spacing: spacing) {
                    ForEach(rowElements, id: \.self) { element in
                        content(element)
                            .fixedSize()
                            .readSize { size in
                                elementsSize[element] = size
                            }
                    }
                }
            }
        }
    }

    func computeRows() -> [[Data.Element]] {
        var rows: [[Data.Element]] = [[]]
        var currentRow = 0
        var remainingWidth = availableWidth

        for element in data {
            let elementSize = elementsSize[element, default: CGSize(width: availableWidth, height: 1)]

            if remainingWidth - (elementSize.width + spacing) >= 0 {
                rows[currentRow].append(element)
            } else {
                currentRow +=  1
                rows.append([element])
                remainingWidth = availableWidth
            }

            remainingWidth -= (elementSize.width + spacing)
        }

        return rows
    }
}

extension View {
    func readSize(onChange: @escaping (CGSize) -> Void) -> some View {
        background(
            GeometryReader { geometryProxy in
                Color.clear
                    .preference(key: FlexibleViewSizePreferenceKey.self, value: geometryProxy.size)
            }
        )
        .onPreferenceChange(FlexibleViewSizePreferenceKey.self, perform: onChange)
    }
}

private struct FlexibleViewSizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
}
