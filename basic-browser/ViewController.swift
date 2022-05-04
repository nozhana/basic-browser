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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Hacking with Swift"
        
        let url = URL(string: "https://www.hackingwithswift.com")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
        
    }


}

