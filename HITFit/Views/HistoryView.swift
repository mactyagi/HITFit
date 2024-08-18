//
//  HistoryView.swift
//  HITFit
//
//  Created by Manukant Tyagi on 11/08/24.
//

import SwiftUI



struct HistoryView: View {
    @EnvironmentObject var history: HistoryStore
    @Binding var showHistory: Bool
    var body: some View {
        ZStack(alignment: .topTrailing) {
            //cross Button
            Button(action: {
                showHistory.toggle()
            }, label: {
                Image(systemName: "xmark.circle")
            })
            .font(.title)
            .padding()

            VStack{
                Text("History")
                    .font(.title)
                    .padding()
                Form {
                    ForEach(history.exerciseDays) { days in
                        Section {
                            ForEach(days.exercises, id: \.self) { exercise in
                                Text(exercise)
                            }
                        } header: {
                            Text(days.date.formatted(as: "MMM d"))
                                .font(.headline)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    HistoryView(showHistory: .constant(true))
        .environmentObject(HistoryStore())
}
