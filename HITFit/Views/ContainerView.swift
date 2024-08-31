//
//  ContainerView.swift
//  HITFit
//
//  Created by Manukant Tyagi on 30/08/24.
//

import SwiftUI

struct ContainerView<Content: View>: View {
    var content: Content


    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .foregroundColor(Color.background)
            VStack{
                Spacer()
                Rectangle()
                    .frame(height: 25)
                    .foregroundColor(.background)
            }
            content
        }

    }



}

#Preview {
    ContainerView {
        VStack {
            RaisedButton(buttonText: "Hello world") {

            }
            .padding(50)

            Button("Tap me") {}
                .buttonStyle(EmbosedButtonStyle(buttonShape: .round))
        }
    }
    .padding(50)
}
