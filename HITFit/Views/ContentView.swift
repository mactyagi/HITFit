//
//  ContentView.swift
//  HITFit
//
//  Created by Manukant Tyagi on 24/07/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            WelcomeView()
            ForEach(0 ..< 4) {index in
                ExerciseView(index: index)
            }
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .never))
    }
}

#Preview {
    ContentView()
}
