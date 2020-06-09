//
//  ViewController.swift
//  Project 0
//
//  Created by Landrieu, William on 9/9/19.
//  Copyright © 2019 Landrieu, William. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate{
    
    let webView = WKWebView()

    override func viewDidLoad() {
        super.viewDidLoad()

        webView.frame = view.bounds
        webView.navigationDelegate = self

        let url = URL(string: "https://scoutradioz.com")!
        let urlRequest = URLRequest(url: url)

        webView.load(urlRequest)
        webView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        view.addSubview(webView)
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    }
