//
//  Userdata_encode.swift
//  App
//
//  Created by JackSon TMM on 26/6/2020.
//  Copyright © 2020 JackSon TMM. All rights reserved.
//

import SwiftUI
struct postlist:Codable {
    var list:[post]
}


struct post:Codable {
    let PostID:Int
    let Username:String
    let UserIcon:String
    let Date:String
    let Text:String
    var IsFollowed:Bool
    var IsVip:Bool
    var Comment:Int
    var Liked:Int
    let PostImages:[String]
}

extension post{
    var CommentTotal:String{
        if Comment == 0{
            return "Comment"
        }else if Comment < 1000{
            return String(Comment)
        }
        else{
            return String(format:"%0.1fk",Double(Comment)/1000)
            // set change format fomat("%type...",variable)
        }
            
    }
    
    var LikedTotal:String{
        if Liked == 0{
            return "Like"
        }else if Liked < 1000{
            return String(Liked)
        }
        else{
            return String(format:"%0.1fk",Double(Liked)/1000) // set change format fomat("%type...",variable)
        }
    }
}

let user = userdata("UserRecord.json")

let userdata = {(filename:String)->(postlist) in
    guard let url = Bundle.main.url(forResource: filename, withExtension: nil) else{
        fatalError("Can't not find the file")
    }
    
    guard let data = try?Data(contentsOf: url) else{
        fatalError("can't get the data through url")
    }
    
    guard let userdata = try?JSONDecoder().decode(postlist.self, from: data) else{
        fatalError("Can't encode frome the data")
    }
    
    return userdata
}

//Function
func loadData(filename:String)->postlist{
    guard let url = Bundle.main.url(forResource: filename, withExtension: nil) else{
        fatalError("Can't not find the file")
    }
    
    guard let data = try?Data(contentsOf: url) else{
        fatalError("can't get the data through url")
    }
    
    guard let userdata = try?JSONDecoder().decode(postlist.self, from: data) else{
        fatalError("Can't encode frome the data")
    }
    
    return userdata
}


func setimages(filename:String)->Image{
    return Image(uiImage: UIImage(named: filename)!)
}
