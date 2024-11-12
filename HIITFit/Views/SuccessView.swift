//
//  SuccessView.swift
//  HIITFit
//
//  Created by Dmitry Kirichenko on 24.10.2024.
//

import SwiftUI

struct SuccessView: View {
    @Binding var selectedTab: Int
    @Environment(\.dismiss) var dismiss
    
    let text = """
      Good job completing all four exercises!
      Remember tomorrow's another day.
      So eat well and get some rest.
      """
    
    var body: some View {
        ZStack() {
            VStack() {
                Image(systemName: "hand.raised.fill")
                    .resizedToFill(width: 75, height: 75)
                    .foregroundColor(Color.purple)
                    .padding()
                Text("High five!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text(text)
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.center)
                
            }
            VStack {
                Spacer()
                Button("Continue") {
                    selectedTab = 9
                    dismiss()
                }
                .padding()
            }
        }
    }
}

#Preview {
    SuccessView(selectedTab: .constant(3))
}
