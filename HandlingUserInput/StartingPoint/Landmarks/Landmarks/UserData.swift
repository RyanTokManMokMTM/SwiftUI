//
//  UserData.swift
//  Landmarks
//
//  Created by JackSon TMM on 20/7/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI
import Combine


//Enviroment obj
class UserData: ObservableObject {
    @Published var IsFavour = false
    @Published var Landmark = landmarkData
}


