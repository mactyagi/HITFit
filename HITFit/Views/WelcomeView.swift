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
        ZStack {
            VStack {
                HStack(alignment: .bottom){
                    VStack(alignment: .leading){
                        Text("Get Fit")
                            .font(.largeTitle)
                        Text("With high intensity interval trailing")
                            .font(.headline)
                    }
                    Image("step-up")
                        .resizedToFill(width: 240, height: 240)
                        .clipShape(Circle())

                }
                Button {
                    selectedTab = 0
                } label: {
                    Text("Get Started")
                    Image(systemName: "arrow.right.circle")

                }
                .font(.title)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.gray, lineWidth: 2)
                    )

            }
            VStack {
                HeaderView(selectedTab: $selectedTab, titleText: "Welcome")
                Spacer()
                Button("History") {
                    showHistory.toggle()
                }
                .padding(.bottom)
                .sheet(isPresented: $showHistory) {
                    HistoryView(showHistory: $showHistory)
                }
            }
        }
    }
}

#Preview {
    WelcomeView(selectedTab: .constant(9))
}
