//
//  GradientBackground.swift
//  HITFit
//
//  Created by Manukant Tyagi on 30/08/24.
//

import SwiftUI

struct GradientBackground: View {

    var gradient: Gradient {

        return Gradient(stops: [
            Gradient.Stop(color: .gradientTop, location: 0),
            Gradient.Stop(color: .gradientBottom, location: 0.9),
            Gradient.Stop(color: .background, location: 0.9),
            Gradient.Stop(color: .background, location: 1)
        ])
    }

    var body: some View {
        LinearGradient(
            gradient: gradient,
            startPoint: .top,
            endPoint: .bottom)
        .ignoresSafeArea()
    }
}

#Preview {
    GradientBackground()
}
