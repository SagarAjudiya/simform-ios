//
//  ViewController.swift
//  DelegateExample
//
//  Created by Sagar Ajudiya on 24/03/23.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Outlet variable
    @IBOutlet weak var label:UILabel!
    @IBOutlet weak var button: UIButton!
    
    var customView: CustomView = CustomView()

    // MARK: Lifecycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        customView = (Bundle.main.loadNibNamed("CustomView", owner: self, options: nil)?.first as? CustomView)!
    

    }
    
    // MARK: Action Method
    @IBAction func presentCustomView(_ sender: UIButton) {
        customView.center = view.center
        view.addSubview(customView)
        customView.delegate = self
    }

}

// MARK: Extension TextTransferDelegate
extension ViewController: TextTransferDelegate {
    
    func transferText(text: String) {
        if text != "" {
            label.text = text
            customView.removeFromSuperview()
        }
    }
    
}


