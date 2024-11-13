//
//  HistoryView.swift
//  HIITFit
//
//  Created by Dmitry Kirichenko on 24.10.2024.
//

import SwiftUI

struct HistoryView: View {
  @EnvironmentObject var history: HistoryStore
  @Binding var showHistory: Bool

  var headerView: some View {
    HStack {
      Spacer()
      Text("History")
        .font(.title)
      Spacer()
      Button {
        showHistory.toggle()
      } label: {
        Image(systemName: "xmark.circle")
      }
      .font(.title)
    }
  }

  func dayView(day: ExerciseDay) -> some View {
      Text(day.date.formatted(as: "d MMM YYYY"))
        .font(.headline)
  }

  func exerciseView(day: ExerciseDay) -> some View {
    ForEach(day.uniqueExercises, id: \.self) { exercise in
      Text(exercise)
        .badge(day.countExercise(exercise: exercise))
    }
  }

  var body: some View {
    VStack {
      headerView
        .padding()
      Form {
        ForEach(history.exerciseDays) { day in
          dayView(day: day)
        }
    }
    .onDisappear {
      try? history.save()
    }
  }
}

struct HistoryView_Previews: PreviewProvider {
  static var history = HistoryStore(preview: true)
  static var previews: some View {
    HistoryView(showHistory: .constant(true))
      .environmentObject(history)
  }
}
