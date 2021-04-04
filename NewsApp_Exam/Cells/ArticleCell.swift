//
//  ArticleCell.swift
//  NewsApp_Exam
//
//  Created by Tsibulko on 27.08.2020.
//  Copyright © 2020 Tsibulko. All rights reserved.
//

import UIKit


class ArticleCell: UITableViewCell {

    @IBOutlet weak var headlineLabel: UILabel!
    @IBOutlet weak var articleImageView: UIImageView!
    
    var articleToDisplay:Article?
    
    func displayArticle(_ article:Article) {
        
        headlineLabel.text = ""
        headlineLabel.alpha = 0
        articleImageView.image = nil
        articleImageView.alpha = 0
        
        articleToDisplay = article
        
        headlineLabel.text = articleToDisplay!.title
        
        UIView.animate(withDuration: 0.8, delay: 0.1, options: .curveEaseOut, animations: {
            self.headlineLabel.alpha = 1
        }, completion: nil)
        
        guard articleToDisplay!.urlToImage != nil else {
            return
        }
        
        let urlString = articleToDisplay!.urlToImage!
        
        if let imageData = CacheManager.retreiveData(urlString) {
            
            articleImageView.image = UIImage(data: imageData)
            
            UIView.animate(withDuration: 0.8, delay: 0.1, options: .curveEaseOut, animations: {
                self.articleImageView.alpha = 1
            }, completion: nil)
            
            return
        }
        
        let url = URL(string: urlString)
        
        guard url != nil else {
            return
        }
        
        let session = URLSession.shared
        
        let datatask = session.dataTask(with: url!) { (data, response, error) in
            
            if error == nil && data != nil {
                
                CacheManager.saveData(urlString, data!)
                
                if self.articleToDisplay!.urlToImage == urlString {
                    
                    DispatchQueue.main.async {
                        
                        self.articleImageView.image = UIImage(data: data!)
                        
                        UIView.animate(withDuration: 0.8, delay: 0.1, options: .curveEaseOut, animations: {
                            self.articleImageView.alpha = 1
                        }, completion: nil)
                    }
                }
                
            }// end of IF statement
        } // end of datatask
        
        datatask.resume()
        
    } //end of func displayArticle()

    
} // end of class ArticleCell: UITableViewCell
