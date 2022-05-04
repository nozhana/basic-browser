//
//  ViewController.swift
//  basic-browser
//
//  Created by Nozhan Amiri on 4/24/22.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    /// A  `WKWebView` object that will represent the view this controller manages.
    ///
    /// Initialized in ``loadView()`` using `webView = WKWebView()`
    var webView: WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: webView, action: #selector(webView.goBack))
        
        let forwardButton = UIBarButtonItem(image: UIImage(systemName: "chevron.right"), style: .plain, target: webView, action: #selector(webView.goForward))
        
        if webView.canGoBack {
            navigationItem.setLeftBarButton(backButton, animated: true)
        } else {
            navigationItem.setLeftBarButton(nil, animated: true)
        }
        
        if webView.canGoForward {
            navigationItem.setRightBarButton(forwardButton, animated: true)
        } else {
            navigationItem.setRightBarButton(nil, animated: true)
        }
 
 
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Hacking with Swift"
        
        let url = URL(string: "https://www.hackingwithswift.com")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
               
        let openButton = UIBarButtonItem(title: "Open page", style: .plain, target: self, action: #selector(openTapped))
               
        toolbarItems = [openButton]
        
    }
    
    @objc func openTapped() {
        let ac = UIAlertController(title: "Open page...", message: nil, preferredStyle: .actionSheet)
        
        ac.addAction(UIAlertAction(title: "apple.com", style: .default, handler: openPage))
        ac.addAction(UIAlertAction(title: "google.com", style: .default, handler: openPage))
        ac.addAction(UIAlertAction(title: "finnhub.io", style: .default, handler: openPage))
        ac.addAction(UIAlertAction(title: "hackingwithswift.com", style: .default, handler: openPage))
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        ac.popoverPresentationController?.barButtonItem = toolbarItems?.first
        present(ac, animated: true)
    }

    func openPage(alertAction action: UIAlertAction) {
        let url = URL(string: "https://\(action.title!)")!
        webView.load(URLRequest(url: url))
    }

}

