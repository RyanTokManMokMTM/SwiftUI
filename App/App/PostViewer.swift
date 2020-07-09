//
//  PostViewer.swift
//  App
//
//  Created by JackSon TMM on 29/6/2020.
//  Copyright © 2020 JackSon TMM. All rights reserved.
//

import SwiftUI

struct PostViewer: View {

    var Post:post
    
    init(Post:post){
        self.Post = Post
        UITableView.appearance().separatorStyle = .singleLine
        UITableView.appearance().tableFooterView = UIView() //remove line of list bottom
        
    }
    var body: some View {
        List{
                Postcell(Post: Post)
                    .listRowInsets(EdgeInsets())
            
                ForEach(1...5,id:\.self){i in
                    Text("test\(i)")
                }
            }
            .navigationBarTitle("Detail",displayMode: .inline)

        }
    }


struct PostViewer_Previews: PreviewProvider {
    static var previews: some View {
        PostViewer(Post:user.list[0])
    }
}
