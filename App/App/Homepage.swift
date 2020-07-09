//
//  Homepage.swift
//  App
//
//  Created by JackSon TMM on 29/6/2020.
//  Copyright © 2020 JackSon TMM. All rights reserved.
//

import SwiftUI

struct Homepage: View {
    @State var index:CGFloat = 0
    init(){
        UITableView.appearance().separatorStyle  = .none
        //From UIKIT list/table defalut having the separetor line
        UITableViewCell.appearance().selectionStyle = .none
        //From UIKIT list/Table default when selecting the cell of a list will appear a gray color
    }
    var body: some View {

        NavigationView{
            GeometryReader{ geometry in
                HScrollViewControl(pageWidth: geometry.size.width, contentSize: CGSize(width: geometry.size.width*2, height: geometry.size.height),page: self.$index)
                {
                    VStack(spacing:0){
                        HStack(spacing:0){
                            PostList(category: .Following)
                                .frame(width:UIScreen.main.bounds.width)
                            PostList(category: .For_you)
                                .frame(width:UIScreen.main.bounds.width)
                                }
                        }
                    }
//                    Mainmeun()
//                        .frame(width:UIScreen.main.bounds.width)
//                        .offset(y:-20)
                    .edgesIgnoringSafeArea(.bottom) // disable the safearea
                    .navigationBarItems(leading: HomeNavBar(touching: self.$index))
                    .navigationBarTitle("Home",displayMode: .inline)
            }
        }
 
    }
}

    



struct Homepage_Previews: PreviewProvider {
    static var previews: some View {
        Homepage()
    }
}
