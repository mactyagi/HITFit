//
//  ContentView.swift
//  HITFit
//
//  Created by Manukant Tyagi on 24/07/24.
//

import SwiftUI

struct ContentView: View {

    // @SceneStorage is used to store the Scene
    @SceneStorage("selectedTab") private var selectedTab = 9
    var body: some View {

        ZStack {
            GradientBackground()
            TabView(selection: $selectedTab)  {
                WelcomeView(selectedTab: $selectedTab)
                    .tag(9)
                ForEach(Exercise.exercises.indices, id: \.self) { index in
                    ExerciseView(selectedTab: $selectedTab, index: index)
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
    }
}

//#Preview {
//    ContentView()
//}

struct ContentView_Previews: PreviewProvider {
    static var history = HistoryStore(preview: true)
    static var previews: some View{
        ContentView()
            .environmentObject(history)
    }
}
