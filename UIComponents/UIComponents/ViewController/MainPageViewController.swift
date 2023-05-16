//
//  MainPageViewController.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 05/05/23.
//

import UIKit

class MainPageViewController: UIPageViewController {
    
    // MARK: Variables
    // array of ViewControllers
    private lazy var orderedViewController: [UIViewController] = [viewControllerWith(name: "BlueViewController"), viewControllerWith(name: "RedViewController")]
    
    private var currentIndex: Int = 0
    private var pageControl = UIPageControl()

    // MARK: View Controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }
    
    // MARK: SetUp Views
    private func setupViews() {
        self.delegate = self
        self.dataSource = self
        configurePageControl()
        setupControllers()
    }
    
    // adding pageControl
    private func configurePageControl() {
        pageControl = UIPageControl(frame: CGRect(x: 0, y: view.frame.maxY - 50 , width: view.frame.width, height: 50))
        pageControl.numberOfPages = orderedViewController.count
        pageControl.currentPage = 0
        pageControl.tintColor = UIColor.black
        pageControl.pageIndicatorTintColor = UIColor.white
        pageControl.currentPageIndicatorTintColor = UIColor.black
        view.addSubview(pageControl)
        print(view.frame.minY)
    }
    
    // getting ViewControllers
    private func viewControllerWith(name: String) -> UIViewController {
        print(#function)
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: name)
    }
    
    // set first ViewController
    private func setupControllers() {
        currentIndex = 0
        let firstViewController = orderedViewController[currentIndex]
        setViewControllers([firstViewController], direction: .forward, animated: false)
        print(#function)
    }

}

// MARK: Extension MainPageViewController
extension MainPageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    // MARK: Delegates
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = orderedViewController.firstIndex(of: viewController) else {
            return nil
        }
        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0, orderedViewController.count > previousIndex else {
            return nil
        }

        return orderedViewController[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = orderedViewController.firstIndex(of: viewController) else {
            return nil
        }
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllerCount = orderedViewController.count
        
        guard orderedViewControllerCount != nextIndex, orderedViewControllerCount > nextIndex else {
            return nil
        }
        
        return orderedViewController[nextIndex]
    }
    
//     Total viewController // -> For Reference of Inbuilt PageControl
//    func presentationCount(for pageViewController: UIPageViewController) -> Int {
//        return orderedViewController.count
//    }
    
//    Current Index of page // -> For Reference of Inbuilt PageControl
//    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
//        return currentIndex
//    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if let firstController = viewControllers?.first, let index = orderedViewController.firstIndex(of: firstController) {
            print(index)
            self.pageControl.currentPage = index
        }
    }
    
}
