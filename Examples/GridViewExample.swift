//
//  GridViewExample.swift
//
//  Created by Ali Sefa Alparslan on 15.11.2024.
//  Copyright © 2024 Ali Sefa Alparslan.
//  Licensed under the MIT License. See the LICENSE file for more details.
//

import SwiftUI
import ReductedShimmer

struct GridViewExample: View {
    // Sample data for the grid
    let items = Array(1...20) // Number of items in the grid

    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], spacing: 10) {
                ForEach(items, id: \.self) { item in
                    GridItemView()
                        .cornerRadius(10)
                        .shimmer(
                            direction: .right,
                            animationAutoreverses: true,
                            gradient: Gradient(colors: [
                                Color.primary,
                                Color.gray,
                                Color.primary,
                                Color.gray,

                            ]))
                }
            }
            .padding(.horizontal, 10)
        }
    }
}

struct GridItemView: View {

    let title = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua"
    let date = "25 Jan 1995"

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Image
            Image(systemName: "message.circle")
                .resizable()
                .frame(minWidth: 100, minHeight: 150, maxHeight: 150)
                .frame(height: 150)

            // Title
            Text(title)
                .font(.headline)
                .lineLimit(4)
                .multilineTextAlignment(.leading)
                .padding(.trailing, 8)

            // Date
            Text(date)
                .font(.subheadline)
                .padding(.bottom, 8)
        }

        .clipShape(RoundedRectangle(cornerRadius: 10))

    }
}

struct GridViewExample_Previews: PreviewProvider {
    static var previews: some View {
        GridViewExample()
    }
}
