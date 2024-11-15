//
//  RatingView.swift
//  HIITFit
//
//  Created by Dmitry Kirichenko on 24.10.2024.
//

import SwiftUI

struct RatingView: View {
    
    let exerciseIndex: Int
    @AppStorage("ratings") private var ratings = ""
    @State private var rating = 0
    
    let maximumRating = 5  // 2
    let onColor = Color.red  // 3
    let offColor = Color.gray

    init(exerciseIndex: Int) {
      self.exerciseIndex = exerciseIndex
      // 2
      let desiredLength = Exercise.exercises.count
      if ratings.count < desiredLength {
        // 3
        ratings = ratings.padding(
          toLength: desiredLength,
          withPad: "0",
          startingAt: 0)
      }
    }
    
    var body: some View {
      HStack {
        ForEach(1 ..< maximumRating + 1, id: \.self) { index in
            Button(action: {
              updateRating(index: index)
            }, label: {
              Image(systemName: "waveform.path.ecg")
                .foregroundColor(
                  index > rating ? offColor : onColor)
                .font(.body)
            })
            .buttonStyle(EmbossedButtonStyle(buttonShape: .round))
            .onChange(of: ratings) {
              convertRating()
            }
            .onAppear {
              convertRating()
            }
        }
      }
      .font(.largeTitle)
    }
    
    func updateRating(index: Int) {
      rating = index
      let index = ratings.index(
        ratings.startIndex,
        offsetBy: exerciseIndex)
      ratings.replaceSubrange(index...index, with: String(rating))
    }
    
    fileprivate func convertRating() {
        // 2
        let index = ratings.index(
            ratings.startIndex,
            offsetBy: exerciseIndex)
        // 3
        let character = ratings[index]
        // 4
        rating = character.wholeNumberValue ?? 0
    }
}

#Preview {
    @AppStorage("ratings") var ratings: String?
    ratings = nil
    return RatingView(exerciseIndex: 0)
        .previewLayout(.sizeThatFits)
}

//struct RatingView_Previews: PreviewProvider {
//  @AppStorage("ratings") static var ratings: String?
//  static var previews: some View {
//    ratings = nil
//    return RatingView(exerciseIndex: 0)
//      .previewLayout(.sizeThatFits)
//  }
//}
