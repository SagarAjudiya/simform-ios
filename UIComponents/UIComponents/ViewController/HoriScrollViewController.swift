//
//  HoriScrollViewController.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 24/05/23.
//

import UIKit

class HoriScrollViewController: BaseViewController {
    
    // MARK: IBOutlets
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    // MARK: Variables
    private var contentWidth: CGFloat = 0.0
    private var maxPageIndex = 0
    
    // MARK: View Controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    // MARK: SetUp Views
    private func setupViews() {
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        
        for views in 1...5 {
            let viewsToDisplay = UIView(frame: CGRect(x: (self.view.frame.width * (CGFloat(views - 1)) + 20), y: 20, width: view.frame.width - 40, height: view.frame.height))
            contentWidth += view.frame.width
            viewsToDisplay.backgroundColor = .green
            scrollView.addSubview(viewsToDisplay)
            maxPageIndex += 1
        }
        scrollView.contentSize = CGSize(width: contentWidth, height: view.frame.height)
        
        pageControl.pageIndicatorTintColor = .blue
        pageControl.currentPageIndicatorTintColor = .red
        pageControl.numberOfPages = maxPageIndex
    }
    
    // MARK: IBActions
    @IBAction func pageControlTapped(_ sender: UIPageControl) {
        let current = sender.currentPage
        scrollView.setContentOffset(CGPoint(x: current * Int(view.frame.size.width), y: 0), animated: true)
    }
    
}

// MARK: Extension HoriScrollViewController
extension HoriScrollViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = Int(scrollView.contentOffset.x / scrollView.frame.width)
        pageControl.currentPage = pageIndex
        print(pageIndex)
    }

}
