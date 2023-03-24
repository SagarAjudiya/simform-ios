//
//  ViewController.swift
//  DelegateExample
//
//  Created by Sagar Ajudiya on 24/03/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label:UILabel!
    @IBOutlet weak var button: UIButton!
    
    var customView: CustomView = CustomView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        customView = (Bundle.main.loadNibNamed("CustomView", owner: self, options: nil)?.first as? CustomView)!
    

    }
    
    @IBAction func presentCustomView(_ sender: UIButton) {
        customView.center = self.view.center
        self.view.addSubview(customView)
        customView.delegate = self
    }

}

extension ViewController: TextTransferDelegate {
    func transferText(text: String) {
        if text != "" {
            self.label.text = text
            self.customView.removeFromSuperview()
        }
    }
}


