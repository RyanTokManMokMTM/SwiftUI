//
//  Symbol.swift
//  Landmarks
//
//  Created by JackSon TMM on 21/7/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI

struct Symbol: View {
 static let symbolColor = Color(red: 79.0 / 255, green: 79.0 / 255, blue: 191.0 / 255)
    var body: some View {

          GeometryReader { geometry in
              Path { path in
                  let width = min(geometry.size.width, geometry.size.height)
                let height = width*0.75
                  let spacing = width * 0.030
                  let middle = width / 2
                  let topWidth = 0.226 * width
                let topHeight = 0.5 * height
                  
                  path.addLines([
                      CGPoint(x: middle, y: spacing),
                      CGPoint(x: middle - topWidth, y: topHeight-spacing),
                      CGPoint(x: middle, y: topHeight / 2 + spacing),
                      CGPoint(x: middle+topWidth, y: topHeight-spacing),
                      CGPoint(x: middle, y: spacing)
                  ])
                
                
                path.move(to: CGPoint(x: middle, y: topHeight + spacing * 3))
                path.addLines([
                    CGPoint(x: middle - topWidth, y: topHeight + spacing),
                    CGPoint(x: spacing, y: height - spacing),
                    CGPoint(x: width - spacing, y: height - spacing),
                    CGPoint(x: middle + topWidth, y: topHeight + spacing),
                    CGPoint(x: middle , y: topHeight/2 + spacing*3)
                ])
              }
              .fill(Self.symbolColor)
          }
      }
}

struct Symbol_Previews: PreviewProvider {
    static var previews: some View {
        Symbol()
    }
}
