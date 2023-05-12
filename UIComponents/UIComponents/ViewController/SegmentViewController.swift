//
//  SegmentViewController.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 01/05/23.
//

import UIKit

class SegmentViewController: BaseViewController {

    // MARK: IBOutlet
    @IBOutlet private weak var lblSegmentIndex: UILabel!
    @IBOutlet private weak var lblPageIndex: UILabel!
    @IBOutlet private weak var lblStepperCount: UILabel!
    @IBOutlet private weak var segmentCtrl: UISegmentedControl!
    @IBOutlet private weak var imgView: UIImageView!
    
    // MARK: View Controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    // MARK: SetUp Views
    private func setupViews() {
        
        // segment target
        segmentCtrl.addTarget(self, action: #selector(actionOnSegment), for: .valueChanged)
        setImageForSegment()
    }
     
    @objc private func actionOnSegment() {
        print(segmentCtrl.selectedSegmentIndex)
        print(segmentCtrl.isSelected)
    }
    
    // Set Images for Segments
    private func setImageForSegment() {
        
        // vertical segment controller  // -> For Reference Purpose
//        segmentCtrl.transform = CGAffineTransformMakeRotation(.pi / 2.0);
        
        let img1 = UIImage(named: "uncheck")
        let img2 = UIImage(named: "uncheck")
        let img3 = UIImage(named: "check")
        
        segmentCtrl.setDividerImage(img1, forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        segmentCtrl.setDividerImage(img2, forLeftSegmentState: .selected, rightSegmentState: .selected, barMetrics: .default)
        segmentCtrl.setDividerImage(img3, forLeftSegmentState: .normal, rightSegmentState: .selected, barMetrics: .default)
    }
        
    // MARK: IBAction
    @IBAction func segmentValue(_ sender: UISegmentedControl) {
        lblSegmentIndex.text = "Selected: \(sender.selectedSegmentIndex)"
        print("Segment", sender.selectedSegmentIndex)
    }
    
    @IBAction func pageValue(_ sender: UIPageControl) {
        lblPageIndex.text = "Selected: \(sender.currentPage + 1)"
        print("Page Controller", sender.currentPage)
    }
    
    @IBAction func stepperValue(_ sender: UIStepper) {
        lblStepperCount.text = "Stepper: \(sender.value)"
        print("Stepper", sender.value)
        
        // image size change with stepper
        imgView.transform = CGAffineTransform(scaleX: sender.value, y: sender.value)
    }
    
    @IBAction func segmentImage(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case SegmentControlImage.google.rawValue:
            imgView.image = UIImage(named: "googleimg")
        case SegmentControlImage.facebook.rawValue:
            imgView.image = UIImage(named: "facebookimg")
        case SegmentControlImage.instagram.rawValue:
            imgView.image = UIImage(named: "instagramimg")
        default:
            imgView.image = UIImage(named: "googleimg")
        }
    }
    
}
