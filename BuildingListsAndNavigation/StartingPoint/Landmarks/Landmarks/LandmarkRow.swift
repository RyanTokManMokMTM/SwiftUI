//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by JackSon TMM on 14/7/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI

struct LandmarkRow: View {
    var land:Landmark
    
    var body: some View {
        
        HStack{
            land.image
                .resizable()
                .frame(width:50,height: 50)
            Text(land.name)
            Spacer()
        }
        .padding(.horizontal,10)

    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        
        Group{
             LandmarkRow(land: landmarkData[0])
            LandmarkRow(land: landmarkData[1])

        }
        .previewLayout(.fixed(width: 300, height: 70))

    }
}
