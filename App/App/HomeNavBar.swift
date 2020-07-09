//
//  HomeNavBar.swift
//  App
//
//  Created by JackSon TMM on 29/6/2020.
//  Copyright © 2020 JackSon TMM. All rights reserved.
//

import SwiftUI

private var kButtonwidth:CGFloat = 100
private var kButtomheight:CGFloat = 20

struct HomeNavBar: View {
    @Binding var touching:CGFloat // 0 = left 1 = right

    var body: some View {
        HStack(alignment: .top, spacing: 0){
            
            Button(action:{
                
                print("camera cliked")
            }){
                
                Image(systemName: "camera")
                .resizable()
                .scaledToFit()
                .frame(width: kButtonwidth-80, height: kButtomheight+5)
                    .padding(.horizontal,15)
                    .padding(.top,5)
                    .foregroundColor(.black)
            }
            Spacer()
            
            VStack(spacing:5){
                HStack(spacing:0){
                    Text("Following")
                        .fontWeight(.bold)
                        .frame(width:kButtonwidth,height: kButtomheight)
                        .padding(.top,5)
                        .opacity(Double(1-touching*0.5))
                        .onTapGesture { //using tap gesture difference from button,no button effect
                            withAnimation{ // when taping haveing movement animation
                                 self.touching = 0
                            }
                        }
                    
                        Spacer()
                    
                        Text("For You")
                            .fontWeight(.bold)
                            .frame(width:kButtonwidth,height: kButtomheight)
                            .padding(.top,5)
                            .opacity(Double(0.5+touching*0.5))
                            .onTapGesture { //using tap gesture difference from button,no button effect
                                withAnimation{ // // when taping haveing movement animation
                                    self.touching = 1
                                }
                        }
                    

                }.font(.system(size: 16))
                
                
                //GeometryReader 用法
                //他會根據目前盡可能沾滿可用的空間
                //他的width 是=目前view的最大width
                GeometryReader{ Geometry in
                    
    
                    RoundedRectangle(cornerRadius: 4)
                        .foregroundColor(.purple)
                        .frame(width:50,height: 4)
                        .offset(x:Geometry.size.width*(self.touching - 0.5)+(kButtonwidth) * CGFloat((0.5 - self.touching)))
                }.frame(height:4)
                
            }.frame(width:UIScreen.main.bounds.width*0.5)
            
            Spacer()
            Button(action:{
                
                print("camera cliked")
            }){
                
                Image(systemName: "paperplane")
                .resizable()
                .scaledToFit()
                .frame(width: kButtonwidth-80, height: kButtomheight+5)
                    .padding(.horizontal,15)
                    .padding(.top,5)
                    .foregroundColor(.black)
            }
        }.frame(width:UIScreen.main.bounds.width)
    }
}

struct HomeNavBar_Previews: PreviewProvider {
    static var previews: some View {

        HomeNavBar(touching:.constant(0))
    }
}
