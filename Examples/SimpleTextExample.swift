//
//  SimpleTextExample.swift
//
//  Created by Ali Sefa Alparslan on 15.11.2024.
//  Copyright © 2024 Ali Sefa Alparslan.
//  Licensed under the MIT License. See the LICENSE file for more details.
//

import SwiftUI
import ReductedShimmer

struct SimpleTextExample: View {
    // Sample data for the grid
    let items = Array(1...20) // Number of items in the grid

    var body: some View {
        VStack {
            Text("Hello, World!")
                .shimmer(
                    duration: 1,
                    direction: .left,
                    shimmeringDelay: 0,
                    animationAutoreverses: true,
                    gradient: Gradient(
                        colors: [
                            Color.blue,
                            Color.red,
                            Color.green
                        ]
                    )
                )

        }
    }
}

struct SimpleTextExample_Previews: PreviewProvider {
    static var previews: some View {
        SimpleTextExample()
    }
}
