//
//  ArticleService.swift
//  NewsApp_Exam
//
//  Created by Tsibulko on 26.08.2020.
//  Copyright © 2020 Tsibulko. All rights reserved.
//

import Foundation


class ArticleService {
    
    var delegate:ArticleServiceProtocol?
    
    func getArticles() {
        
        // Please, uncomment line of code below and put your API KEY
        //let apiKey = ""
        
        let urlString = "http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=" + apiKey
        
        let url = URL(string: urlString)
        
        guard url != nil else {
            return
        }
        
        let session = URLSession.shared
        
        let datatask = session.dataTask(with: url!) { (data, response, error) in
            
            if error == nil && data != nil {
                
                do {
                    let decoder = JSONDecoder()
                    
                    let arrayArticleService = try decoder.decode(ArticlesStack.self, from: data!)
                    
                    let arrayOfArticles = arrayArticleService.articles!
                    
                    DispatchQueue.main.async {
                        self.delegate?.articlesRetreived(arrayOfArticles)
                    }
                }
                catch {
                    print("Can't decode JSON file!")
                }
            } // end of IF statement
        }//end of datatask
        
        datatask.resume()
    } // end of func getArticles()
    
} //end of class ArticleService
