//
//  ArticlesStack.swift
//  NewsApp_Exam
//
//  Created by Tsibulko on 26.08.2020.
//  Copyright © 2020 Tsibulko. All rights reserved.
//

import Foundation

struct ArticlesStack:Decodable {
    
    var totalResults:Int?
    var articles:[Article]?
}
