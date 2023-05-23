//
//  ScrollViewController.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 23/05/23.
//

import UIKit

class ScrollViewController: BaseViewController {
    
    // MARK: IBOutlets
    @IBOutlet weak private var btnTop: UIButton!
    @IBOutlet weak private var scrollView: UIScrollView!
    @IBOutlet weak private var pageControl: UIPageControl!
    
    // MARK: View Controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    // MARK: SetUp Views
    private func setupViews() {
        self.hideKeyboard()
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
    }
        
    // MARK: IBActions
    @IBAction func btnTopTapped(_ sender: UIButton) {
        scrollView.setContentOffset(.zero, animated: true)
    }
}

// MARK: Extension ScrollViewController
extension ScrollViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(#function)
        let pageIndex = round(scrollView.contentOffset.y/view.frame.height)
        print(pageIndex)
        pageControl.currentPage = Int(pageIndex)
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        print(#function)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        print(#function)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        print(#function)
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        print(#function)
    }
    
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        print(#function)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print(#function)
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        print(#function)
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        print(#function)
        return UIView()
    }
    
    func scrollViewWillBeginZooming(_ scrollView: UIScrollView, with view: UIView?) {
        print(#function)
    }
    
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        print(#function)
    }
    
    func scrollViewShouldScrollToTop(_ scrollView: UIScrollView) -> Bool {
        true
    }
    
    func scrollViewDidScrollToTop(_ scrollView: UIScrollView) {
        print(#function)
    }
    
}
