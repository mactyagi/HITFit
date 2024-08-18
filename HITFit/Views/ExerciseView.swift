//
//  ExerciseView.swift
//  HITFit
//
//  Created by Manukant Tyagi on 25/07/24.
//

import SwiftUI
import AVKit

struct ExerciseView: View {
    @EnvironmentObject var history: HistoryStore
    @State private var showHistory = false
    @State private var showSuccess = false
    @Binding var selectedTab: Int
    let index : Int
    var lastExercise: Bool {
        index + 1 == Exercise.exercises.count
    }
    var exercise: Exercise {
        Exercise.exercises[index]
    }

    @State private var timerDone = false
    @State private var showTimer = false
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0){
                HeaderView(selectedTab: $selectedTab, titleText: exercise.exerciseName)
                    .padding(.bottom)

                VideoPlayerView(videoName: exercise.videoName)
                    .frame(height: geometry.size.height * 0.45)

                HStack(spacing: 150){
                    startButton
                    doneButton
                        .disabled(!timerDone)
                        .sheet(isPresented: $showSuccess, content: {
                            SuccessView(selectedTab: $selectedTab)
                                .presentationDetents([.medium,.large])
                        })
                }
                .font(.title3)
                .padding()

                if showTimer {
                    TimerView(
                        timerDone: $timerDone,
                        size:  geometry.size.height * 0.07)
                }


                Spacer()
                
                RatingView(exerciseIndex: index)
                    .padding()

                Button("History") {
                    showHistory.toggle()
                }
                .padding(.bottom)
                .sheet(isPresented: $showHistory, content: {
                    HistoryView(showHistory: $showHistory)
                })
            }
        }
    }


    var startButton: some View {
        Button("Start Exercise") {
            showTimer.toggle()
        }
    }

    var doneButton: some View {
        Button("Done") {
            history.addDoneExercise(exercise.exerciseName)
            timerDone = false
            showTimer.toggle()
            if lastExercise{
                showSuccess.toggle()
            }else {
                selectedTab += 1
            }

        }
    }
}

#Preview {
    ExerciseView(selectedTab: .constant(3), index: 3)
        .environmentObject(HistoryStore())
}


