//
//  DetailViewController.swift
//  NewsApp_Exam
//
//  Created by Tsibulko on 29.08.2020.
//  Copyright © 2020 Tsibulko. All rights reserved.
//

import UIKit
import WebKit


class DetailViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    var articleURL:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        webView.navigationDelegate = self
        
    } // end of override func viewDidLoad()
    
    override func viewWillAppear(_ animated: Bool) {
        
        if articleURL != nil {
            
            let url = URL(string: articleURL!)
            
            guard url != nil else {
                return
            }
            
            let request = URLRequest(url: url!)
            
            spinner.alpha = 1
            spinner.startAnimating()
            
            webView.load(request)
        }
    } //end of override func viewWillAppear

} //end of class DetailViewController: UIViewController


// MARK: - WKNavigationDelegate

extension DetailViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        spinner.stopAnimating()
        spinner.alpha = 0
    }
} // end of extension DetailViewController: WKNavigationDelegate
