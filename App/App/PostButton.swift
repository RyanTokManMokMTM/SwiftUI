//
//  PostButton.swift
//  App
//
//  Created by JackSon TMM on 26/6/2020.
//  Copyright © 2020 JackSon TMM. All rights reserved.
//

import SwiftUI

struct PostButton: View {
    var button:String;
    var action:()->()//clouser
    var color:Color
    var text:String
    
    var body: some View {
        HStack{
            Button(action:action){
                Image(systemName:button)
                    .resizable()
                    .scaledToFit()
                    .frame(width:20,height: 20)
                    .foregroundColor(color)
            Text(text)
                .font(.system(size:15))
                .foregroundColor(color)
                
            }.buttonStyle(BorderlessButtonStyle())
        }
    }
}

struct PostButton_Previews: PreviewProvider {
    static var previews: some View {
        PostButton(button: "heart", action: {print("test")}, color: .red, text: "Like")
    }
}
