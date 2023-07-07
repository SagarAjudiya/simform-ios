//
//  WebKitViewController.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 02/05/23.
//

import UIKit
import WebKit

class WebKitViewController: BaseViewController {

    // MARK: IBOutlet
    @IBOutlet private weak var webView: WKWebView!
    @IBOutlet private weak var progress: UIActivityIndicatorView!
    @IBOutlet private weak var searchBar: UISearchBar!
    
    // MARK: View Controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    // MARK: SetUp Views
    private func setupViews() {
        
        // increase progressview size
        self.progress.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        
        webView.uiDelegate = self
        webView.navigationDelegate = self
        searchBar.delegate = self
        
        // Custom images in SearchBar // -> For Reference Purpose
//        searchBar.setImage(UIImage(named: "check"), for: .clear, state: .normal)
//        searchBar.setScopeBarButtonBackgroundImage(UIImage(named: "check"), for: .normal)
    
        loadWebView()
        
        // load HTML String
        webView.loadHTMLString(Constant.htmlString, baseURL: nil)
    }
    
    // load From URL
    private func loadWebView() {
        guard let url = URL(string: Constant.String.url) else {
            return
        }
        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }
    
}

// MARK: Extension WebKitViewController
extension WebKitViewController: WKNavigationDelegate, WKUIDelegate {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print(#function)
        progress.stopAnimating()
    }
    
    // 2
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print(#function)
    }
    
    // 1
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        print("navigationAction", #function)
        print(webView.url?.absoluteURL ?? "")
        decisionHandler(.allow)
    }
    
    // 3
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        print("navigationResponse", #function)
        print(webView.url?.absoluteURL ?? "")
        decisionHandler(.allow)
    }
    
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        
        if navigationAction.targetFrame == nil {
            UIApplication.shared.open(navigationAction.request.url!)
        }
        print("createWebViewWith", #function)
        return nil
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print(#function)
        print(error)
    }
    
}

// MARK: Extension WebKitViewController
extension WebKitViewController: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(#function)
        print(searchText)
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        print(#function)
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print(#function)
    }
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        print(#function)
        return true
    }
    
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        print(#function)
        return false
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print(#function)
        print(searchBar.text ?? "")
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print(#function)
    }
    
    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
        print(#function)
    }
    
    func searchBarResultsListButtonClicked(_ searchBar: UISearchBar) {
        print(#function)
    }

}
