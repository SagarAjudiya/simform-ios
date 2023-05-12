//
//  PageControlViewController.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 02/05/23.
//

import UIKit

class PageControlViewController: BaseViewController {
    
    private var slides = [Slide]()
    
    // MARK: IBOutlets
    
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var pageControl: UIPageControl!
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var btnBack: UIButton!
    @IBOutlet private weak var btnNext: UIButton!
    
    // MARK: View Controller lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        setupViews()
        
    }
    
    // MARK: SetUp Views

    private func setupViews() {
        slides = createSlides()
        setupSlideScrollView(slides: slides)

        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        view.bringSubviewToFront(pageControl)
    }
    
    private func isNextPage(isNext: Bool) {
        var current = pageControl.currentPage
        print(pageControl.numberOfPages)
        print(current)
        
        if isNext {
            current += 1
            scrollView.setContentOffset(CGPoint(x: current * Int(view.frame.size.width), y: 0), animated: true)
        } else {
            current -= 1
            scrollView.setContentOffset(CGPoint(x: current * Int(view.frame.size.width), y: 0), animated: true)
        }
    }
    
    // MARK: IBAction
    
    @IBAction func pageCtrlChange(_ sender: UIPageControl) {
        let current = sender.currentPage
        scrollView.setContentOffset(CGPoint(x: current * Int(view.frame.size.width), y: 0), animated: true)
    }
    
    @IBAction func backBtnClicked(_ sender: UIButton) {
        isNextPage(isNext: false)
    }
    
    @IBAction func nextBtnClicked(_ sender: UIButton) {
        isNextPage(isNext: true)
    }
    
    // set Slide Images and Titles
    func setSlide(title: String, description: String, imageName: String) -> Slide {
      let slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
      slide.imageView.image = UIImage(named: imageName)
      slide.labelTitle.text = title
      slide.labelDesc.text = description
      return slide
    }
    
    // Slides for all four views
    private func createSlides() -> [Slide] {
        let slide1: Slide = setSlide(title: "A real-life bear 1", description: "Did you know that Winnie the chubby little cubby was based on a real, young bear in London", imageName: "onboard1")
        let slide2: Slide = setSlide(title: "A real-life bear 1", description: "Did you know that Winnie the chubby little cubby was based on a real, young bear in London", imageName: "onboard2")
        let slide3: Slide = setSlide(title: "A real-life bear 1", description: "Did you know that Winnie the chubby little cubby was based on a real, young bear in London", imageName: "onboard3")
        let slide4: Slide = setSlide(title: "A real-life bear 1", description: "Did you know that Winnie the chubby little cubby was based on a real, young bear in London", imageName: "onboard4")
        let slide5: Slide = setSlide(title: "A real-life bear 1", description: "Did you know that Winnie the chubby little cubby was based on a real, young bear in London", imageName: "onboard5")
        
        return [slide1, slide2, slide3, slide4, slide5]
    }
    
    // each view setup in main view
    private func setupSlideScrollView(slides : [Slide]) {

        scrollView.isPagingEnabled = true
        contentView.frame.size.width = view.frame.width * CGFloat(slides.count + 1)
        
        for i in slides.indices {
            slides[i].frame = CGRect(x: (view.frame.width * CGFloat(i) + view.frame.width/2), y: 0, width: view.frame.width, height: view.frame.height)
            contentView.addSubview(slides[i])
        }
    }
    
}

// MARK: Extension PageControlViewController

extension PageControlViewController: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)

    }
    
}


