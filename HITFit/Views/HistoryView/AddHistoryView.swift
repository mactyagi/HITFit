//
//  AddHistoryView.swift
//  HITFit
//
//  Created by Manukant Tyagi on 31/08/24.
//

import SwiftUI

struct AddHistoryView: View {
    @Binding var addMode: Bool
    @State private var exerciseDate = Date()

    var body: some View {
        VStack {
            ZStack {
                Text("Add Exercise")
                    .font(.title)
                Button("Done") {
                    addMode = false
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }

            ButtonView(date: $exerciseDate)
            DatePicker(
                "Choose Date",
                selection: $exerciseDate,
                in: ...Date(),
                displayedComponents: .date)
            .datePickerStyle(.graphical)
        }
        .padding()
        .background(Color.primary.colorInvert()
            .shadow(color: .primary.opacity(0.5), radius: 7))
    }


    struct ButtonView: View {
        @EnvironmentObject var history: HistoryStore
        @Binding var date: Date
        var body: some View {
            HStack {
                ForEach(Exercise.exercises.indices, id: \.self) { index in
                    let exerciseName = Exercise.exercises[index].exerciseName
                    Button(exerciseName) {
                        history.addExercise(date: date, exerciseName: exerciseName)
                        // save the exercise
                    }
                }
            }
            .buttonStyle(EmbosedButtonStyle(buttonScale: 1.5))
        }
    }
}

struct AddHistoryView_Previews: PreviewProvider {
  static var previews: some View {
    AddHistoryView(addMode: .constant(true))
      .environmentObject(HistoryStore(preview: true))
  }
}
