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
        backButton.tintColor = .blue
        
        let forwardButton = UIBarButtonItem(image: UIImage(systemName: "chevron.right"), style: .plain, target: webView, action: #selector(webView.goForward))
        
        let openButton = UIBarButtonItem(title: "Open page...", style: .plain, target: self, action: nil)
        
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
        
        toolbarItems = [openButton]
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Hacking with Swift"
        
        let url = URL(string: "https://www.hackingwithswift.com")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
        
    }


}

