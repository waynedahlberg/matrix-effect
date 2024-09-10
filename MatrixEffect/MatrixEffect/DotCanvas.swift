//
//  DotCanvas.swift
//  MatrixEffect
//
//  Created by Wayne Dahlberg on 9/10/24.
//

import SwiftUI

struct DotCanvas: View {
  let dots: [Dot]
  let dotSize: CGFloat
  var body: some View {
    Canvas { context, size in
      for dot in dots {
        context.fill(
          Path(ellipseIn: CGRect(
            x: dot.x - dotSize/2,
            y: dot.y - dotSize/2,
            width: dotSize,
            height: dotSize
          )),
          with: .color(.white)
        )
      }
    }
  }
}

struct Dot: Equatable {
  var x: CGFloat
  var y: CGFloat
  let originX: CGFloat
  let originY: CGFloat
  var vx: CGFloat = 0
  var vy: CGFloat = 0
}

//#Preview {
//  DotCanvas()
//}
