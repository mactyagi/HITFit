//
//  RaisedButton.swift
//  HITFit
//
//  Created by Manukant Tyagi on 19/08/24.
//

import SwiftUI

struct RaisedButton: View {
    let buttonText: String
    let action: () -> Void
    var body: some View {

        Button {
            action()
        } label: {
            Text(buttonText)
                .raisedButtonTextStyle()
        }
        .buttonStyle(.raised)

    }
}

#Preview {
    ZStack{
        RaisedButton(buttonText: "Get started") {
            print("Hello world")
        }
            .padding(20)
    }
    .background(Color.background)
    .previewLayout(.sizeThatFits)
}


struct RaisedButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding([.top, .bottom], 12)
            .background(
                Capsule()
                    .foregroundColor(.background)
                    .shadow(color: .dropShadow, radius: 4, x: 6, y: 6)
                    .shadow(color: .dropHighlight, radius: 4, x: -6, y: -6)
            )

    }
}

extension ButtonStyle where Self == RaisedButtonStyle {
    static var raised: RaisedButtonStyle {
        .init()
    }
}

extension Text{
    func raisedButtonTextStyle() -> some View {
        self
            .font(.body)
            .fontWeight(.bold)
    }
}
