//
//  BarChartWeekView.swift
//  HIITFit
//
//  Created by Dmitry Kirichenko on 14.11.2024.
//

import SwiftUI
import Charts

struct BarChartWeekView: View {
  @EnvironmentObject var history: HistoryStore

  var body: some View {
      Chart(history.exerciseDays.prefix(7)) { day in
        BarMark(
          x: .value("Date", day.date.dayName),
          y: .value("Total Count", day.exercises.count))
      }    .padding()
  }
}


#Preview {
    BarChartWeekView()
        .environmentObject(HistoryStore(preview: true))
}
