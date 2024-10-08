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
    @State private var showReport = false
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
                            HStack {
                                historyButton
                                    .padding(.trailing)
                                reportButton
                            }
                        }

                        VStack {
                            WelcomeView.welcomeText
                            getStartedButton
                            Spacer()
                            HStack {
                                historyButton
                                    .padding(.trailing)
                                reportButton
                            }
                        }
                    }
                }
                .frame(height: geometry.size.height * 0.8)
            }
            .sheet(isPresented: $showHistory, content: {
                HistoryView(showHistory: $showHistory)
            })
            .sheet(isPresented: $showReport, content: {
                ReportView()
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


    var reportButton: some View {
        Button(action: {
            showReport.toggle()
        }, label: {
            Text("Reports")
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
