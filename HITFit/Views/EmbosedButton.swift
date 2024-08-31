//
//  EmbosedButton.swift
//  HITFit
//
//  Created by Manukant Tyagi on 19/08/24.
//

import SwiftUI

enum EmbosedButtonShape{
    case round, capsule
}

struct EmbosedButtonStyle: ButtonStyle {
    var buttonShape = EmbosedButtonShape.capsule
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(10)
            .background(
                GeometryReader{ geometry in
                    shape(size: geometry.size)
                        .foregroundColor(.background)
                        .shadow(color: .dropShadow, radius: 1, x: 2, y: 2)
                        .shadow(color: .dropHighlight, radius: 1, x: -2, y: -2)
                        .offset(x: -1, y: -1)
                }
            )
    }

    @ViewBuilder
    func shape(size: CGSize) -> some View {
        switch buttonShape {
        case .round:
            Circle()
                .stroke(Color.background, lineWidth: 2)
                .frame(
                    width: .maximum(size.width, size.height),
                    height: .maximum(size.width, size.height))
                .offset(x: -1)
                .offset(y: -max(size.width, size.height) / 2 +
                min (size.width, size.height) / 2)
        case .capsule:
            Capsule()
                .stroke(Color.background, lineWidth: 2)
        }
    }
}


#Preview {
    Button("History") {}
        .fontWeight(.bold)
        .buttonStyle(EmbosedButtonStyle(buttonShape: .round))
        .padding(40)
        .previewLayout(.sizeThatFits)

}
