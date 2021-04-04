//
//  Article.swift
//  NewsApp_Exam
//
//  Created by Tsibulko on 26.08.2020.
//  Copyright © 2020 Tsibulko. All rights reserved.
//

import Foundation

struct Article:Decodable {
   
    var author:String?
    var title:String?
    var description:String?
    var url:String?
    var urlToImage:String?
    var publishedAt:String?
}
