//
//  ExerciseView.swift
//  HIITFit
//
//  Created by Dmitry Kirichenko on 01.10.2024.
//

import SwiftUI

struct ExerciseView: View {
    
    let videoNames = ["Exers1", "Exers2",
                      "Exers3","Exers4"]
    
    let exerciseNames = ["Abs exercise", "Weight loss",
                         "Abs exercise 2", "Legs"]
    
    let index: Int
    
    var body: some View {
        Text(exerciseNames[index])
    }
}

#Preview {
    ExerciseView(index: 0)
}
