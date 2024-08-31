//
//  RatingView.swift
//  HITFit
//
//  Created by Manukant Tyagi on 27/07/24.
//

import SwiftUI

struct RatingView: View {
    let exerciseIndex: Int
    @AppStorage("ratings") private var ratings = ""
    @State private var rating = 0
    let maximumRating: Int = 5
    let onColor = Color.red
    let offColor = Color.gray

    init(exerciseIndex: Int) {
        self.exerciseIndex = exerciseIndex
        let desireLength = Exercise.exercises.count
        if ratings.count < desireLength{
            ratings = ratings.padding(toLength: desireLength, withPad: "0", startingAt: 0)
        }
    }

    
    var body: some View {
        HStack {
            ForEach(1 ..< maximumRating + 1, id: \.self) { index in
                Button(action: {
                    updateRating(index: index)
                }, label: {
                    Image(systemName: "waveform.path.ecg")
                })
                .foregroundColor(
                    index > rating ? offColor : onColor
                )
                .buttonStyle(EmbosedButtonStyle(buttonShape: .round))
                .onTapGesture {

                }
                .onChange(of: ratings) {
                    convertRating()
                }
                .onAppear(perform: {
                    convertRating()
                })
                .font(.largeTitle)


            }
        }
    }

    fileprivate func convertRating() {
        let index = ratings.index(
            ratings.startIndex,
            offsetBy: exerciseIndex)
        let character = ratings[index]
        rating = character.wholeNumberValue ?? 0
    }


    func updateRating(index: Int){
        rating = index
        let index = ratings.index(ratings.startIndex, offsetBy: exerciseIndex)
        ratings.replaceSubrange(index...index, with: String(rating))

    }
}

#Preview{
    RatingView(exerciseIndex: 0)
        .previewLayout(.sizeThatFits)
}

