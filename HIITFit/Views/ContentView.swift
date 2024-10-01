//
//  ContentView.swift
//  HIITFit
//
//  Created by Dmitry Kirichenko on 30.09.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            WelcomeView()
            ForEach(0..<4) { index in
                ExerciseView(index: index)
            }
            Text("Exercise 2")
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}

#Preview {
    ContentView()
}
