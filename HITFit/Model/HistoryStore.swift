//
//  HistoryStore.swift
//  HITFit
//
//  Created by Manukant Tyagi on 11/08/24.
//

import Foundation

enum FileError: Error {
   case loadFailure
   case saveFailure
}

struct ExerciseDay: Identifiable {
    let id = UUID()
    let date: Date
    var exercises: [String] = []
}

class HistoryStore: ObservableObject {
    @Published var loadingError = false
    @Published var exerciseDays : [ExerciseDay] = []
    var dataURL: URL {
        URL.documentsDirectory
            .appendingPathComponent("history.plist")
    }

    init() {
        do {
            try load()
        } catch {
            loadingError = true
        }
    }

    func addDoneExercise(_ exerciseName: String) {
        let today = Date()
        if let firstDate = exerciseDays.first?.date, today.isSameDay(as: firstDate) {
            exerciseDays[0].exercises.append(exerciseName)
        }else{
            exerciseDays.insert(ExerciseDay(date: today, exercises: [exerciseName]), at: 0)
        }
        do {
            try save()
        }catch {
            fatalError(error.localizedDescription)
        }

    }

    func load() throws {
        do {
            guard let data = try? Data(contentsOf: dataURL) else { return }
            let plistData = try PropertyListSerialization.propertyList(from: data, format: .none)
            let convertedPlist = plistData as? [[Any]] ?? []
            exerciseDays = convertedPlist.map({ ExerciseDay(
                date: $0[1] as? Date ?? Date(),
                exercises: $0[2] as? [String] ?? []) })
        }catch {
            throw FileError.loadFailure
        }
    }

    func save () throws {
        let plistData = exerciseDays.map {[$0.id.uuidString, $0.date, $0.exercises]}
        do {
            let data = try PropertyListSerialization.data(
                fromPropertyList: plistData,
                format: .binary,
                options: .zero)

            try data.write(to: dataURL, options: .atomic)
        }catch {
            throw FileError.saveFailure
        }
    }
}




