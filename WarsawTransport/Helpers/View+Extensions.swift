//
//  View+Extensions.swift
//  WarsawTransport
//
//  Created by Alex Azarov on 12/9/23.
//

import SwiftUI

extension View {
    @ViewBuilder
    func tabSheet<SheetContent: View>(
        initialHeight: CGFloat = 110,
        sheetCornerRadius: CGFloat = 15,
        @ViewBuilder content: () -> SheetContent
    ) -> some View  {
        self.modifier(
            BottomSheetModifier(
                initialHeight: initialHeight,
                sheetCornerRadius: sheetCornerRadius,
                sheetView: content()
            )
        )
    }
}

private struct BottomSheetModifier<SheetContent: View>: ViewModifier {
    @State private var sheetPresented: Bool = true

    let initialHeight: Double
    let sheetCornerRadius: Double
    let sheetView: SheetContent

    func body(content: Content) -> some View {
        content
            .sheet(isPresented: $sheetPresented, content: {
                VStack(spacing: 0) {
                    sheetView

                    Rectangle()
                        .fill(.clear)
                        .frame(height: CustomTabBar.Constants.height)
                }
                .presentationDetents([.height(initialHeight), .medium, .fraction(0.999)])
                .presentationCornerRadius(sheetCornerRadius)
                .presentationBackground(.regularMaterial)
                .presentationBackgroundInteraction(.enabled(upThrough: .medium))
                .interactiveDismissDisabled()
            })
    }
}
