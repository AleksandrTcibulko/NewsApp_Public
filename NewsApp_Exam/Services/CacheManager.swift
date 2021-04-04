//
//  CacheManager.swift
//  NewsApp_Exam
//
//  Created by Tsibulko on 28.08.2020.
//  Copyright © 2020 Tsibulko. All rights reserved.
//

import Foundation

class CacheManager {
    
    static var imageDictionary = [String:Data]()
    
    static func saveData(_ url:String, _ imageData:Data) {
        
        imageDictionary[url] = imageData
    }
    
    static func retreiveData(_ url:String) -> Data? {
        
        return imageDictionary[url]
    }
    
} // end of class CacheManager
