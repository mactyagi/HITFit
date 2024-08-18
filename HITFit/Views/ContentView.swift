//
//  ContentView.swift
//  HITFit
//
//  Created by Manukant Tyagi on 24/07/24.
//

import SwiftUI

struct ContentView: View {

    // @StateObject is the read only property wrapper
    @StateObject private var historyStore = HistoryStore()

    // @SceneStorage is used to store the Scene
    @SceneStorage("selectedTab") private var selectedTab = 9
    var body: some View {

        TabView(selection: $selectedTab)  {
            WelcomeView(selectedTab: $selectedTab)
                .tag(9)
            ForEach(Exercise.exercises.indices, id: \.self) { index in
                ExerciseView(selectedTab: $selectedTab, index: index)
                    .tag(index)
            }
        }
        .onAppear(perform: {
            print(URL.documentsDirectory)
        })
        .environmentObject(historyStore)
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .never))
        .alert(isPresented: $historyStore.loadingError, content: {
            Alert(
                title: Text("History"),
                message:Text( """
Unfortunately we can't load your past history.
        Email support:
          support@xyz.com
"""))
        })
    }
}

#Preview {
    ContentView()
}
