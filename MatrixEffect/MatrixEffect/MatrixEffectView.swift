//
//  MatrixEffectView.swift
//  MatrixEffect
//
//  Created by Wayne Dahlberg on 9/10/24.
//

import SwiftUI

struct MatrixEffect: View {
  @StateObject private var model = MatrixEffectModel()
  var body: some View {
    ZStack {
      GeometryReader { geometry in
        DotCanvas(dots: model.dots, dotSize: model.dotSize)
          .gesture(
            DragGesture(minimumDistance: 0)
              .onChanged { value in
                model.touchLocation = value.location
              }
              .onEnded { _ in
                model.touchLocation = CGPoint(x: -1000, y: -1000)
              }
          )
          .onAppear {
            model.initializeDots(in: geometry.size)
          }
          .onChange(of: geometry.size) { _, newSize in
            model.initializeDots(in: newSize)
          }
      }
      .background(Color.black)
      .edgesIgnoringSafeArea(.all)
      VStack {
        Spacer()
        controlPanel
      }
    }
  }
  
  private var controlPanel: some View {
    VStack(spacing: 10) {
      SliderView(value: $model.dotSize, range: 1...10, title: "Dot size")
      SliderView(value: $model.touchBoundingSize, range: 50...200, title: "Touch Bounding")
      SliderView(value: $model.dotInertia, range: 0.01...0.5, title: "Dot Inertia")
    }
    .padding()
    .background(Color.black.opacity(0.5))
    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
    .padding()
  }
}

//#Preview {
//  MatrixEffectView()
//}
