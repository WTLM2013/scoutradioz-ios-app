//
//  ViewController.swift
//  Project 0
//
//  Created by Landrieu, William on 9/9/19.
//  Copyright © 2019 Landrieu, William. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

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

    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if navigationAction.navigationType == .linkActivated  {
            if let url = navigationAction.request.url,
                let host = url.host, !host.hasPrefix("www.google.com"),
                UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
                print(url)
                print("Redirected to browser. No need to open it locally")
                decisionHandler(.cancel)
            } else {
                print("Open it locally")
                decisionHandler(.allow)
            }
        } else {
            print("not a user click")
            decisionHandler(.allow)
        }
    }
}
