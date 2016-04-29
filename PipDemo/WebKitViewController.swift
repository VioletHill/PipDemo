//
//  WebKitViewController.swift
//  PipDemo
//
//  Created by QiuFeng on 4/29/16.
//  Copyright © 2016 www.qiufeng.me. All rights reserved.
//

import UIKit
import WebKit

class WebKitViewController: UIViewController {

    let webview = WKWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(webview)
        webview.translatesAutoresizingMaskIntoConstraints = false
        webview.topAnchor.constraintEqualToAnchor(view.topAnchor).active = true
        webview.trailingAnchor.constraintEqualToAnchor(view.trailingAnchor).active = true
        webview.leadingAnchor.constraintEqualToAnchor(view.leadingAnchor).active = true
        webview.bottomAnchor.constraintEqualToAnchor(view.bottomAnchor).active = true
        webview.navigationDelegate = self
        let url = NSURL(string: "https://www.apple.com/cn")
        webview.loadRequest(NSURLRequest(URL: url!))
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension WebKitViewController: WKNavigationDelegate {

}
