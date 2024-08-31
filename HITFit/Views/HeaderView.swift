//
//  HeaderView.swift
//  HITFit
//
//  Created by Manukant Tyagi on 27/07/24.
//

import SwiftUI

struct HeaderView: View {
    @Binding var selectedTab: Int
    let titleText: String
    var body: some View {
        ZStack {
            VStack {
                Text(titleText)
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundColor(.white)
                HStack {
                    ForEach (Exercise.exercises.indices, id: \.self) { index in
                        ZStack {
                            Circle()
                                .foregroundColor(.white)
                                .frame(width: 32, height: 32)
                                .opacity(index == selectedTab ? 0.5 : 0)
                            Circle()
                                .foregroundColor(.white)
                                .frame(width: 16, height: 16)
                        }
                        .onTapGesture {
                            selectedTab = index
                        }

                    }
                }
                .font(.title2)
            }
        }

    }
}

#Preview {
    HeaderView(selectedTab: .constant(0), titleText: "Squat")
        .background {
            Color.black
        }
}
