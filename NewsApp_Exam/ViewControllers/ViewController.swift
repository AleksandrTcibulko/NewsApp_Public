//
//  ViewController.swift
//  NewsApp_Exam
//
//  Created by Tsibulko on 26.08.2020.
//  Copyright © 2020 Tsibulko. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var articles = [Article]()
    var articleService = ArticleService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        articleService.delegate = self
        articleService.getArticles()
        
    } //end of override func viewDidLoad()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let indexPath = tableView.indexPathForSelectedRow
        
        guard indexPath != nil else {
            return
        }
        
        let tappedArticle = articles[indexPath!.row]
        
        let detailVC = segue.destination as! DetailViewController
        detailVC.articleURL = tappedArticle.url
    }

} // end of class ViewController


//MARK: - ArticleServiceProtocol

extension ViewController: ArticleServiceProtocol {
    
    func articlesRetreived(_ articles: [Article]) {
        
        self.articles = articles
        tableView.reloadData()
    }
    
} // end of extension ViewController: ArticleServiceProtocol


//MARK: - UITableViewDataSource, UITableViewDelegate

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as! ArticleCell
        
        let article = articles[indexPath.row]
        
        cell.displayArticle(article)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "goToDetailVC", sender: self)
    }
    
} // end of extension ViewController: UITableViewDataSource, UITableViewDelegate
