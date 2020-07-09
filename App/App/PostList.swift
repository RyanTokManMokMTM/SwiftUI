//
//  PostList.swift
//  App
//
//  Created by JackSon TMM on 26/6/2020.
//  Copyright © 2020 JackSon TMM. All rights reserved.
//

import SwiftUI

struct PostList: View {
    var category:PostCate
    
    //according to the enum(knowed type to identidy some type be using)
    var posttype:postlist{
        switch category {
            case .Following:
                return loadData(filename:"UserRecord.json")
            case .For_you:
                return loadData(filename:"userdataforyou.json")
        }
    }
    var body: some View {
        List{
            ForEach(self.posttype.list,id: \.PostID){ post in
                ZStack{
                    Postcell(Post:post)
                    NavigationLink(destination: PostViewer(Post: post)){
                        EmptyView()
                    }
                    .hidden() // hidden the empty View
                }.listRowInsets(EdgeInsets())
            }

        }
        
    }
}

struct PostList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            PostList(category: .For_you)
                .navigationBarTitle("Test",displayMode: .inline)
        }
    
    }
}
