//
//  SuccessView.swift
//  HITFit
//
//  Created by Manukant Tyagi on 15/08/24.
//

import SwiftUI


struct SuccessView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var selectedTab: Int
    var body: some View {
        ZStack {
            VStack {
                Image(systemName: "hand.raised.fill")
                    .resizedToFill(width: 75, height: 75)
                    .foregroundColor(Color.purple)

                Text("High Five!")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text("""
                    Good Job completing all four exercises!
                    Remember tomorrow's another day.
                    So eat well and get some rest.
                    """)
                .foregroundColor(Color.gray)
                .multilineTextAlignment(.center)
            }

            VStack{
                Spacer()
                Button("Continue") {
                    selectedTab = 9  // welcome screen has tag value 9
                    dismiss()


                }
                .padding()
            }
        }
    }
}

#Preview {
    SuccessView( selectedTab: .constant(0))
}
