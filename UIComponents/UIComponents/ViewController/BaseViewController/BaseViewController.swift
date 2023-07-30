//
//  BaseViewController.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 09/05/23.
//

import UIKit

class BaseViewController: UIViewController {
    
    // MARK: Variables
    private var keyboardHeightLayoutConstraint: NSLayoutConstraint?

    // MARK: View Controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Change View Height
    func addKeyBoardNotificationChangeObserver(_ keyboardHeightLayoutConstraint: NSLayoutConstraint?) {
        self.keyboardHeightLayoutConstraint = keyboardHeightLayoutConstraint
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardNotification(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    @objc func keyboardNotification(notification: NSNotification) {
        guard let userInfo = notification.userInfo else { return }
        let endFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
        let endFrameY = endFrame?.origin.y ?? 0
        let duration: TimeInterval = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue ?? 0
        let animationCurveRawNSN = userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? NSNumber
        let animationCurveRaw = animationCurveRawNSN?.uintValue ?? UIView.AnimationOptions.curveEaseInOut.rawValue
        let animationCurve: UIView.AnimationOptions = UIView.AnimationOptions(rawValue: animationCurveRaw)
        if endFrameY >= UIScreen.main.bounds.size.height {
            keyboardHeightLayoutConstraint?.constant = 0.0
        } else {
            keyboardHeightLayoutConstraint?.constant = (endFrame?.size.height ?? 0.0) - 50
        }
        UIView.animate(
            withDuration: duration,
            delay: TimeInterval(0),
            options: animationCurve,
            animations: { [weak self] in
                self?.view.layoutIfNeeded()
            },
            completion: nil)
    }
    
    // MARK: deinit
    deinit{
        print("Deinit call \(self)")
    }
    
}
