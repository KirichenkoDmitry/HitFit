//
//  WelcomeView.swift
//  HIITFit
//
//  Created by Dmitry Kirichenko on 01.10.2024.
//

import SwiftUI

struct WelcomeView: View {
  @EnvironmentObject var historyStore: HistoryStore
  @State private var showHistory = false
  @Binding var selectedTab: Int

  var body: some View {
    GeometryReader { geometry in
      VStack {
        HeaderView(
          selectedTab: $selectedTab,
          titleText: "Welcome")
        Spacer()
        // container view
        ContainerView {
          ViewThatFits {
            VStack {
              WelcomeView.images
              WelcomeView.welcomeText
              getStartedButton
              Spacer()
              historyButton
            }
            VStack {
              WelcomeView.welcomeText
              getStartedButton
              Spacer()
              historyButton
            }
          }
        }
        .frame(height: geometry.size.height * 0.8)
      }
      .sheet(isPresented: $showHistory) {
        HistoryView(showHistory: $showHistory)
      }
    }
  }

  var getStartedButton: some View {
    RaisedButton(buttonText: "Get Started") {
      selectedTab = 0
    }
    .padding()
  }

  var historyButton: some View {
    Button(
      action: {
        showHistory = true
      }, label: {
        Text("History")
          .fontWeight(.bold)
          .padding([.leading, .trailing], 5)
      })
      .padding(.bottom, 10)
      .buttonStyle(EmbossedButtonStyle())
  }
}

#Preview {
    WelcomeView(selectedTab: .constant(9))
}
