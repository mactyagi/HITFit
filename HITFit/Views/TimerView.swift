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
            .padding()
            .onChange(of: date) {
                timesRemaining -= 1
            }
    }
}

struct TimerView: View {
    @State private var timeRemaining = 3
    @Binding var timerDone: Bool
    let size: Double
    var body: some View {
        TimelineView(
            .animation(
                minimumInterval: 1.0,
                paused: timeRemaining <= 0)) { context in
                    CoundDownView(
                        date: context.date,
                        timesRemaining: $timeRemaining,
                        size: size)
        }
                .onChange(of: timeRemaining) {
                    if timeRemaining <= 0 {
                        timerDone = true
                    }
                }
    }
}

#Preview {
    TimerView(timerDone: .constant(false), size: 90)
}
