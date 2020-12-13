//
//  ViewController.swift
//  Alert and Sheet
//
//  Created by Eman on 10/5/20.
//  Copyright © 2020 task. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
  
    var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "open", style: .plain, target: self, action: #selector(openTapped))
    }
    
    @IBAction func didTapButton (){
        openTapped()
    }
    @objc func openTapped() {
        let alert = UIAlertController( title: nil, message: "Incorta Mobile app provides you with access to Incorta Analytics Platform. If you don’t have access to an Incorta Analytics server, tap Lean More for more information.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Learn More", style: .default, handler: openPage))
        
        alert.addAction(UIAlertAction(title: "Close", style: .cancel, handler: {action in
            print("tapped dismiss")
        }))
        
        alert.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        
        present(alert, animated: true)
    }
    
    func openPage(action: UIAlertAction){
        let actionTitle = "https://www.incorta.com/get-started"
        guard let url = URL(string: actionTitle) else { return }
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
        webView.load(URLRequest(url: url))
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title  = webView.title
    }
}

