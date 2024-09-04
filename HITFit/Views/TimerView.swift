//
//  TimerView.swift
//  HITFit
//
//  Created by Manukant Tyagi on 17/08/24.
//

import SwiftUI

struct CoundDownView: View {
    let date: Date
    @Binding var timesRemaining: Int
    let size: Double


    var body: some View {
        Text("\(timesRemaining)")
            .font(.system(size: size, design: .rounded))
            .fontWeight(.heavy)
            .padding()
            .frame(
                minWidth: 180,
                maxWidth: 200,
                minHeight: 180,
                maxHeight: 200
            )
            .onChange(of: date) {
                timesRemaining -= 1
            }
    }
}



struct TimerView: View {
    @Environment(\.dismiss) var dismiss
    @State private var timeRemaining = 60
    @Binding var timerDone: Bool
    let exerciseName: String
    let size: Double
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                Color.background
                    .ignoresSafeArea()
                let gradient = Gradient(stops: [
                    Gradient.Stop(color: .gradientTop, location: 0.7),
                    Gradient.Stop(color: .gradientBottom, location: 1.1)
                ])
                Circle()
                    .foregroundStyle(gradient)
                    .position(x: geometry.size.width * 0.5, y: -geometry.size.width * 0.2)
                VStack {
                    Text(exerciseName)
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .foregroundStyle(.white)
                        .padding(.top , 20)
                    Spacer()
                }
                TimelineView(
                    .animation(
                        minimumInterval: 1.0,
                        paused: timeRemaining <= 0)) { context in

                            IndentView {
                                CoundDownView(
                                    date: context.date,
                                    timesRemaining: $timeRemaining,
                                    size: size)
                            }
                        }
                        .onChange(of: timeRemaining) {
                            if timeRemaining <= 0 {
                                timerDone = true
                            }
                        }
                VStack {
                    Spacer()
                    RaisedButton(buttonText: "Done") {
                        dismiss()
                    }
                    .opacity(timerDone ? 1 : 0)
                    .padding([.leading, .trailing], 30)
                    .padding([.bottom], 60)
                    .disabled(!timerDone)
                }
            }
        }
    }
}

#Preview {
    TimerView(timerDone: .constant(false), exerciseName: "Setup Up", size: 90)
}
