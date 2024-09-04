//
//  HITFitApp.swift
//  HITFit
//
//  Created by Manukant Tyagi on 24/07/24.
//

import SwiftUI

@main
struct HITFitApp: App {

    // @StateObject is the read only property wrapper
    @StateObject private var historyStore = HistoryStore()


    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(historyStore)
                .onAppear(perform: {
                    print(URL.documentsDirectory)
                })
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
}
