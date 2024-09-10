//
//  SliderView.swift
//  MatrixEffect
//
//  Created by Wayne Dahlberg on 9/10/24.
//

import SwiftUI

struct SliderView: View {
  @Binding var value: CGFloat
  let range: ClosedRange<CGFloat>
  let title: String
  var body: some View {
    VStack(alignment: .leading) {
      Text("\(title): \(value, specifier: "%.2f")")
        .foregroundColor(.white)
      Slider(value: $value, in: range)
    }
  }
}

//#Preview {
//  SliderView()
//}
