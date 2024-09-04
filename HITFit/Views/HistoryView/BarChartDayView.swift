//
//  BarChartDayView.swift
//  HITFit
//
//  Created by Manukant Tyagi on 02/09/24.
//

import SwiftUI
import Charts

struct BarChartDayView: View {
    let day: ExerciseDay
    var body: some View {
        Chart {
            ForEach(Exercise.names, id: \.self) { name in
                BarMark(
                    x: .value(name, name),
                    y: .value("Total Count", day.countExercise(exercise: name)))
                .foregroundStyle(Color.historyBar)
            }
            RuleMark(y: .value("Exercise", 1))
                .foregroundStyle(.red)
        }
        .padding()
        .onAppear {
            print(day)
        }

    }
}

//#Preview {
//
//    BarChartDayView(day: HistoryStore(preview: true).exerciseDays[0])
//}


struct BarchartDayView_Previews: PreviewProvider {
    static var history = HistoryStore(preview: true)
    static var previews: some View {
        BarChartDayView(day: history.exerciseDays[0])
            .environmentObject(history)
    }

}
