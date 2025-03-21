//
//  ReductedShimmer.swift
//
//  Created by Ali Sefa Alparslan on 15.11.2024.
//  Copyright © 2024 Ali Sefa Alparslan.
//  Licensed under the MIT License. See the LICENSE file for more details.
//

import SwiftUI

// MARK: - Shimmer Modifier
public struct ShimmerModifier: ViewModifier {
    // MARK: - Properties
    @State private var isShimmering: Bool = true
    @State private var shimmerStart: UnitPoint
    @State private var shimmerEnd: UnitPoint

    public var duration: Double = 1.0
    public var direction: ShimmerDirection = .right
    public var shimmeringDelay: Double = 0.0
    public var animationAutoreverses: Bool = true
    public var gradient: Gradient = Gradient(colors: [Color("lightGray"), Color("gray"), Color("lightGray")])

    // MARK: - Init
    public init(
        duration: Double = 1.0,
        direction: ShimmerDirection = .right,
        shimmeringDelay: Double = 0.0,
        animationAutoreverses: Bool = true,
        gradient: Gradient = Gradient(colors: [Color("lightGray"), Color("gray"), Color("lightGray")])
    ) {
        self.duration = duration
        self.direction = direction
        self.shimmeringDelay = shimmeringDelay
        self.animationAutoreverses = animationAutoreverses
        self.gradient = gradient

        switch direction {
        case .right:
            _shimmerStart = State(initialValue: .init(x: -1, y: 0.5))
            _shimmerEnd = State(initialValue: .init(x: 2, y: 0.5))
        case .left:
            _shimmerStart = State(initialValue: .init(x: 2, y: 0.5))
            _shimmerEnd = State(initialValue: .init(x: -1, y: 0.5))
        case .up:
            _shimmerStart = State(initialValue: .init(x: 0.5, y: 2))
            _shimmerEnd = State(initialValue: .init(x: 0.5, y: -1))
        case .down:
            _shimmerStart = State(initialValue: .init(x: 0.5, y: -1))
            _shimmerEnd = State(initialValue: .init(x: 0.5, y: 2))
        }
    }

    public func body(content: Content) -> some View {
        content
            .redacted(reason: .placeholder)
            .overlay(
                LinearGradient(
                    gradient: gradient,
                    startPoint: shimmerStart,
                    endPoint: shimmerEnd
                )
                .mask(content.redacted(reason: .placeholder))
                .onAppear {
                    withAnimation(
                        .linear(duration: duration)
                        .delay(shimmeringDelay)
                        .repeatForever(autoreverses: animationAutoreverses)
                    ) {
                        switch direction {
                        case .right:
                            shimmerStart = .init(x: 1, y: 0.5)
                            shimmerEnd = .init(x: 2, y: 0.5)
                        case .left:
                            shimmerStart = .init(x: -1, y: 0.5)
                            shimmerEnd = .init(x: -2, y: 0.5)
                        case .up:
                            shimmerStart = .init(x: 0.5, y: -1)
                            shimmerEnd = .init(x: 0.5, y: -2)
                        case .down:
                            shimmerStart = .init(x: 0.5, y: 1)
                            shimmerEnd = .init(x: 0.5, y: 2)
                        }
                    }
                }
            )
    }
}

// MARK: - ShimmerDirection Enum
public enum ShimmerDirection {
    case right, left, up, down
}

// MARK: - View Extension for Shimmer Modifier
extension View {
    public func shimmer(
        duration: Double = 1.0,
        direction: ShimmerDirection = .right,
        shimmeringDelay: Double = 0.0,
        animationAutoreverses: Bool = true,
        gradient: Gradient = Gradient(colors: [Color("lightGray"), Color("gray"), Color("lightGray")])
    ) -> some View {
        self.modifier(
            ShimmerModifier(
                duration: duration,
                direction: direction,
                shimmeringDelay: shimmeringDelay,
                animationAutoreverses: animationAutoreverses,
                gradient: gradient
            )
        )
    }
}
