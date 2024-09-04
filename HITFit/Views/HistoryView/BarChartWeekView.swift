//
//  BarChartWeekView.swift
//  HITFit
//
//  Created by Manukant Tyagi on 03/09/24.
//

import SwiftUI
import Charts

struct BarChartWeekView: View {
    enum MarkType {
        case bar
        case line
    }

    @State private var weekData: [ExerciseDay] = []
    @EnvironmentObject var history: HistoryStore
    var markType = MarkType.line
    
    var body: some View {
        Chart(weekData) { day in
            switch markType {
            case .bar:
                ForEach(Exercise.names, id: \.self) { name in
                    BarMark(
                        x: .value("Date", day.date, unit: .day),
                        y: .value("Total Count", day.exercises.count))
                    .foregroundStyle(by: .value("Exercise", name))
                }
            case .line:
                LineMark(
                    x: .value("Date", day.date, unit: .day),
                    y: .value("Total Count", day.exercises.count))
                .symbol(.circle)
                .interpolationMethod(.catmullRom)
            }






        }
        .chartForegroundStyleScale([
            "Burpee" : Color(.chartBurpee),
            "Squat" : Color(.chartSquat),
            "Step Up" : Color(.chartStepUp),
            "Sun Salute" : Color(.chartSunSalute)
        ])
        .padding()
        .onAppear(perform: {
            let firstDate = history.exerciseDays.first?.date ?? Date()
            let dates = firstDate.previousSevenDays
            weekData = dates.map({ date in
                history.exerciseDays.first { $0.date.isSameDay(as: date)} ?? ExerciseDay(date: date)
            })
        })
    }
}


struct BarChartWeekView_Preview: PreviewProvider {
    static var previews: some View {
        BarChartWeekView(markType: .bar)
            .environmentObject(HistoryStore(preview: true))
    }
}
