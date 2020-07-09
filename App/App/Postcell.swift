//
//  Postcell.swift
//  App
//
//  Created by JackSon TMM on 26/6/2020.
//  Copyright © 2020 JackSon TMM. All rights reserved.
//

import SwiftUI

struct Postcell: View {
    var Post:post
    var body: some View {
        VStack(alignment:.leading,spacing:5){
            HStack(spacing:5){
                setimages(filename: Post.UserIcon)
                         .resizable()
                            .scaledToFill()
                            .frame(width:50,height: 50)
                             // .offset(x:-5)
                            .clipShape(Circle())
                            .overlay(RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.red, lineWidth: 1)
                        )
                      
                      
                      VStack(alignment:.leading,spacing:5){
                        Text(Post.Username)
                              .font(.system(size:16))
                              .foregroundColor(.red)
                                .fontWeight(.bold)
                            .lineLimit(1)
                        
                        Text(Post.Date)
                              .font(.system(size:12))
                              .foregroundColor(.gray)
                          
                      }.padding(.leading,5)
                      
                      Spacer()
                      Button(action:{
                          print("Test")
                      }){
                        
                        if(Post.IsFollowed){
                            Text("Unfollow")
                                .font(.system(size:13))
                                .foregroundColor(.red)
                                .frame(width:70,height:25)
                            .overlay(
                                RoundedRectangle(cornerRadius:12)
                                    .stroke(Color.yellow, lineWidth: 1)
                            )
                        }
                        else{
                          Text("Follow")
                              .font(.system(size:13))
                              .foregroundColor(.purple)
                              .frame(width:70,height:25)
                          .overlay(
                              RoundedRectangle(cornerRadius:12)
                                  .stroke(Color.yellow, lineWidth: 1)
                          )
                        }
                      }.buttonStyle(BorderlessButtonStyle())
                  }
                //end of HStack
            Text(Post.Text)
                        .font(.system(size:14))
                        .foregroundColor(.black)
            if !Post.PostImages.isEmpty{
                PostImageCell(images: Post.PostImages, width: UIScreen.main.bounds.width-30)
//                setimages(filename: Post.PostImages[0])
//                        .resizable()
//                        .scaledToFill()
//                        .frame(width:UIScreen.main.bounds.width-30,height:UIScreen.main.bounds.width*0.75)
//                        .clipped()
            }

             Divider()
            
            
            //Button
            HStack{
                Spacer()

                PostButton(button: "heart", action: {
                    print("button clicked")},
                           color: .black,text: Post.LikedTotal)
   
                Spacer()
                PostButton(button: "message", action: {
                    print("button clicked")},
                           color: .black,text: Post.CommentTotal)
                
                Spacer()
                PostButton(button: "paperplane", action: {
                    print("button clicked")},
                           color: .black,text: "Share")
                
                Spacer()
            }
            .frame(height:30)
    
            
            Rectangle()
                .padding(.horizontal,-15)
                .frame(height:10)
                .foregroundColor(Color(red: 238/255, green: 238/255, blue: 238/255))
            
        }.padding(.horizontal,15)
            .padding(.top,5)
        
    }
}

struct Postcell_Previews: PreviewProvider {
    static var previews: some View {
        Postcell(Post: user.list[0])
    }
}
