//
//  Mainmeun.swift
//  App
//
//  Created by JackSon TMM on 29/6/2020.
//  Copyright © 2020 JackSon TMM. All rights reserved.
//

import SwiftUI

struct Mainmeun: View {
    @State var index = 0
    var body: some View {
        VStack{
            Spacer()
            
            Bar(size: self.$index)
        }
        .background(Color.black.opacity(0.05))

    }
}

struct Mainmeun_Previews: PreviewProvider {
    static var previews: some View {
        Mainmeun()
    }
}

struct Bar: View{
    @Binding var size:Int
    
    var body: some View{
        HStack{
            Button(action:{
                self.size = 0
            }){
                VStack{
                    Image(systemName: "house")
                    Text("Home")
                        .font(.system(size: 10))
                }
            }
            .foregroundColor(Color.black.opacity(self.size == 0 ? 1:0.5))
            .offset(x:10,y:4)
            .font(.system(size: 20))
            
            Spacer()
            
            Button(action:{
                self.size = 1
            }){
                VStack{
                    Image(systemName: "magnifyingglass")
                    Text("Discover")
                        .font(.system(size: 10))
                }

              }.foregroundColor(Color.black.opacity(self.size == 1 ? 1:0.5))
            .offset(x:10,y:4)
             .font(.system(size: 20))
            
             Spacer()
            
            
            Button(action:{}){
                    Image(systemName: "plus.rectangle")
                        .font(.system(size: 25))
                        .foregroundColor(.black)
                        
                
            }
            
            Spacer()
            
            Button(action:{
                self.size = 2
            }){
                VStack{
                    Image(systemName: "play.rectangle")
                    Text("Video")
                        .font(.system(size: 10))
                }
    
              }.foregroundColor(Color.black.opacity(self.size == 2 ? 1:0.5))
            .offset(x:10,y:4)
             .font(.system(size: 20))
             Spacer()
            
            Button(action:{
                self.size = 3
            }){
                VStack{
                   Image(systemName: "person")
                    Text("Me")
                        .font(.system(size: 10))
                }
              }.foregroundColor(Color.black.opacity(self.size == 3 ? 1:0.5))
           .font(.system(size: 20))
           .offset(x:10,y:4)
              
        }.padding(.horizontal,25)
            .background(Color.white)
            .font(.system(size:20))
            .frame(width:UIScreen.main.bounds.width,height: UIScreen.main.bounds.width * 0.1 )
        


    }
}
