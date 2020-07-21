//
//  RotatedBadgeSymbol.swift
//  Landmarks
//
//  Created by JackSon TMM on 21/7/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI

struct RotatedBadgeSymbol: View {
    var angle:Angle
    var body: some View {
        Symbol()
            .padding(-60) // set the size of 2D negative => big
            .rotationEffect(angle, anchor: .bottom)
        //anchor which point align to the view centre!
    }
}

struct RotatedBadgeSymbol_Previews: PreviewProvider {
    static var previews: some View {
        RotatedBadgeSymbol(angle: .init(degrees: 5))
    }
}
