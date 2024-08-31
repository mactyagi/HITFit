//
//  WelcomeView.swift
//  HITFit
//
//  Created by Manukant Tyagi on 25/07/24.
//

import SwiftUI

struct WelcomeView: View {
    @Binding var selectedTab: Int
    @State private var showHistory = false
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HeaderView(
                    selectedTab: $selectedTab,
                    titleText: "Welcome")
                Spacer()


                ContainerView {
                    ViewThatFits {
                        VStack {
                            WelcomeView.images
                            WelcomeView.welcomeText
                            getStartedButton
                            Spacer()
                            historyButton
                        }

                        VStack {
                            WelcomeView.welcomeText
                            getStartedButton
                            Spacer()
                            historyButton
                        }
                    }
                }
                .frame(height: geometry.size.height * 0.8)
            }
            .sheet(isPresented: $showHistory, content: {
                HistoryView(showHistory: $showHistory)
            })
        }
    }

    var getStartedButton: some View {
        RaisedButton(buttonText: "Get Started") {
            selectedTab = 0
        }
        .padding()
    }

    var historyButton: some View {
        Button(action: {
            showHistory.toggle()
        }, label: {
            Text("History")
                .fontWeight(.bold)
                .padding([.leading, .trailing], 5)
        })
        .padding(.bottom, 10)

        .buttonStyle(EmbosedButtonStyle())
    }
}

#Preview {
    WelcomeView(selectedTab: .constant(9))
}
