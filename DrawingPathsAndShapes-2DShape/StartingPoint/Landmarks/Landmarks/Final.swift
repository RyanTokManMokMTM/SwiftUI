//
//  Final.swift
//  Landmarks
//
//  Created by JackSon TMM on 21/7/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI
    
struct Final: View {
    static let count = 8
    var background: some View {
        
        ForEach(0..<Final.count){ i in
            RotatedBadgeSymbol(angle: .degrees(Double(i)/Double(Final.count) * 360))
                .opacity(0.5)

        }
        
    }
    
    var body: some View {
        ZStack{
            Draw2D()
                .opacity(0.5)
            
            GeometryReader{ geo in
                self.background
                    .scaleEffect(1.0/4.0, anchor: .top)
                    .position(x: geo.size.width/2.0, y: (2.8/4.0) * geo.size.height)
            }
        .scaledToFit()
        }
    }
}

struct Final_Previews: PreviewProvider {
    static var previews: some View {
        Final()
    }
}
