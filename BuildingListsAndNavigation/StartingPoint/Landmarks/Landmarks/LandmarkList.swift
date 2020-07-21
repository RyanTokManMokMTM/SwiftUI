//
//  LandmarkList.swift
//  Landmarks
//
//  Created by JackSon TMM on 14/7/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
//        List{
//            LandmarkRow(land: landmarkData[0])
//            LandmarkRow(land: landmarkData[1])
//        }
        NavigationView{
            List(landmarkData){ landmark in
                
                NavigationLink(destination: LandmarkDetail(land: landmark)){
                     LandmarkRow(land: landmark)
                }
                .navigationBarTitle(Text("List"),displayMode: .inline)
            }
        }
   

    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        
        ForEach(["iPhone SE", "iPhone XS Max"],id:\.self){ device in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: device)) // preview as divice

        }
    }
}
