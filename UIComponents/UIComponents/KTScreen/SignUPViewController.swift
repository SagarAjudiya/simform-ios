//
//  SignUPViewController.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 02/06/23.
//

import UIKit

class SignUPViewController: BaseViewController {

    // MARK: IBOutlets
    @IBOutlet weak private var imgProfile: UIImageView!
    @IBOutlet weak private var scrollView: UIScrollView!
    @IBOutlet weak private var contentView: UIView!
    @IBOutlet weak private var txtName: UITextField!
    @IBOutlet weak private var txtEmail: UITextField!
    @IBOutlet weak private var txtViewBio: UITextView!
    @IBOutlet weak private var btnTraveler: UIButton!
    @IBOutlet weak private var btnLocal: UIButton!
    @IBOutlet weak private var btnMale: UIButton!
    @IBOutlet weak private var btnFemale: UIButton!
    @IBOutlet weak private var txtDOB: UITextField!
    @IBOutlet weak private var txtCountry: UITextField!
    @IBOutlet weak private var txtHometown: UITextField!
    @IBOutlet weak private var txtViewIceBreaker: UITextView!
    @IBOutlet weak private var btnSubmit: UIButton!
    @IBOutlet weak private var txtViewBioHeight: NSLayoutConstraint!
    @IBOutlet weak private var txtViewiceBreakerHeight: NSLayoutConstraint!
    @IBOutlet weak private var btnImgChange: UIButton!
    @IBOutlet weak private var btnNext: UIButton!
    @IBOutlet weak private var interestView: UIView!
    @IBOutlet weak private var selectInterestClcView: UICollectionView!
    @IBOutlet weak private var lblInterestPlaceHolder: UILabel!
    @IBOutlet weak private var mainView: UIView!
    @IBOutlet weak private var scrollViewBottom: NSLayoutConstraint!
   
    
    // MARK: Variables
    lazy var outlets = [txtName, txtEmail, txtViewBio, btnTraveler, btnLocal, btnMale, btnFemale, txtDOB, txtCountry, txtHometown, txtViewIceBreaker, interestView]
    
    lazy var btnUserType = [btnTraveler, btnLocal]
    lazy var btnGender = [btnMale, btnFemale]
    
    private let countryPickerView = UIPickerView()
    
    private var selectInterest = [String]()
    
    private enum CellConst {
        static let itemSpace = 8.0
        static let lineSpace = 10.0
        static let topC = 10.0
        static let bottomC = 10.0
        static let leftC = 10.0
        static let rightC = 10.0
        static let cellheight = 48 - 20 // viewheight - (top+bottom)
    }
    
    // MARK: View Controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setNavigationBar()
        selectInterestClcView.isHidden = selectInterest.isEmpty
    }

    // MARK: SetUp Views
    private func setupViews() {
        txtName.delegate = self
        txtEmail.delegate = self
        txtViewBio.delegate = self
        txtDOB.delegate = self
        txtCountry.delegate = self
        txtHometown.delegate = self
        txtViewIceBreaker.delegate = self
        
        countryPickerView.delegate = self
        countryPickerView.dataSource = self
        
        selectInterestClcView.delegate = self
        selectInterestClcView.dataSource = self
        
        selectInterestClcView.isHidden = true
        
        // Textfield Placeholder
        txtViewBio.text = Constant.String.txtBioPlace
        txtViewBio.textColor = .lightGray

        txtViewIceBreaker.text = Constant.String.txtIceBreakerPlace
        txtViewIceBreaker.textColor = .lightGray

        txtName.becomeFirstResponder()
        
        datePicker()
        
        txtCountry.inputView = countryPickerView
        
        setNavigationBar()

        setRadioButtonImage(buttons: btnUserType)
        setRadioButtonImage(buttons: btnGender)

        // Set border and radius for all views
        for views in outlets {
            views?.setBorderWidth(width: 1)
            views?.setBorderColor(color: Color.signGrey)
            views?.setCornerRadius(radius: 4)
        }
        
        imgProfile.makeRoundImage()
        imgProfile.contentMode = .scaleAspectFill
        
        btnSetup()
        
        mainView.setCornerRadius(radius: 12)
        scrollView.showsVerticalScrollIndicator = false
        addKeyBoardNotificationChangeObserver(scrollViewBottom)

        txtDOB.addPaddingAndIcon(UIImage(named: Image.calendar) ?? UIImage(), padding: 24, isLeftView: false)
        txtCountry.addPaddingAndIcon(UIImage(named: Image.down) ?? UIImage(), padding: 24, isLeftView: false)
        
        setRightBtn(textField: txtDOB, image: Image.calendar, selector: #selector(dobTapped))
        setRightBtn(textField: txtCountry, image: Image.down, selector: #selector(countryTapped))

        btnSubmit.isEnabled = false
        
        interestView.isUserInteractionEnabled = true
        interestViewTapped()
        
        hideKeyboard()
    }
        
    // MARK: Setup NavigationBar
    private func setNavigationBar() {
        navigationItem.title = Constant.String.SignUpScreenTitle
        let textAttributes = [NSAttributedString.Key.foregroundColor: Color.signWhite]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationController?.navigationBar.backgroundColor = Color.signPrimary
        navigationController?.navigationBar.isTranslucent = false
        
        /// Set back Icon
        navigationController?.navigationBar.backIndicatorImage = UIImage(named: Image.arrowback)
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: Image.arrowback)
        
        Utility.changeStatusBarColor(color: Color.signPrimary)
    }
    
    // MARK: Setup Button
    private func btnSetup() {
        // change profile
        btnImgChange.makeRoundBtn()
        btnImgChange.backgroundColor = Color.signWhite
        btnImgChange.setShadowColor(color: Color.signGrey)
        btnImgChange.setShadowRadius(radius: 0)
        btnImgChange.layer.shadowOffset = CGSize(width: 0, height: 2)
        btnImgChange.layer.masksToBounds = false
        btnImgChange.layer.shadowOpacity = 1
        
        // submit
        btnSubmit.tintColor = Color.signPrimary
        btnSubmit.setCornerRadius(radius: 4)
    }
    
    // MARK: Set Right image in TextField
    private func setRightBtn(textField: UITextField, image: String, selector: Selector) {
        let button = UIButton(frame: CGRect(x: 5, y: 5, width: 20, height: textField.frame.size.height - 10.0))
        button.setImage(UIImage(named: image), for: .normal)
        let rightView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: textField.frame.size.height))
        rightView.addSubview(button)
        textField.rightView = rightView
        textField.rightViewMode = .always
        textField.becomeFirstResponder()
        button.addTarget(self, action: selector, for: .touchUpInside)
    }
    
    // calender button tapped
    @objc func dobTapped() {
        datePicker()
    }
    
    // down arrow tapped
    @objc func countryTapped() {
        txtCountry.inputView = countryPickerView
        txtCountry.becomeFirstResponder()
    }
    
    // MARK: open pickerview for select image
    private func openPickerView(_ sender: UIView) {
        ImagePickerHelper.shared.pick(sender, viewController: self, completionHandler: { [weak self] (image, _) in
            if let image {
                    self?.imgProfile.image = image
            }
        }, cancelHandler: { [weak self] in
            guard self != nil else { return }
        })
    }
    
    // MARK: set images for radio buttons
    private func setRadioButtonImage(buttons: [UIButton?]) {
        for btn in buttons {
            btn?.setImage(UIImage(named: Image.select), for: .selected)
            btn?.setImage(UIImage(named: Image.unselect), for: .normal)
            btn?.configuration?.imagePadding = 10
            btn?.configuration?.baseForegroundColor = .gray
        }
    }
    
    // MARK: datepicker for DOB
    private func datePicker() {
        txtDOB.setDatePickerAsInputViewFor(target: self, selector: #selector(dateIsSelected), max: 0, min: -16)
        txtDOB.becomeFirstResponder()
    }
    
    @objc func dateIsSelected() {
        if let datePickerView = txtDOB.inputView as? UIDatePicker {
            txtDOB.text = datePickerView.date.getFormattedDate()
        }
        txtDOB.resignFirstResponder()
    }
    
    // MARK: InterestView Tapped
    func interestViewTapped() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(openInteretVC))
        interestView.addGestureRecognizer(tap)
    }
    
    @objc private func openInteretVC(button: UIButton) {
        btnNextTapped(btnNext)
    }
    
    // MARK: Check for validation
    private func checkValidation() -> Bool {
        txtName.text?.count ?? 0 > 3 &&
        Validator.shared.isEmailValid(email: txtEmail.text) &&
        !txtViewBio.text.isEmpty &&
        (btnLocal.isSelected || btnTraveler.isSelected) &&
        (btnMale.isSelected || btnFemale.isSelected) &&
        !(txtDOB.text?.isEmpty ?? true) &&
        !(txtCountry.text?.isEmpty ?? true) &&
        !(txtHometown.text?.isEmpty ?? true) &&
        !selectInterest.isEmpty &&
        !txtViewIceBreaker.text.isEmpty
    }
    
    // MARK: Set button UI when selected
    private func isButtonSelected(button: UIButton, isSelect: Bool) {
        if isSelect {
            button.isSelected = true
            button.setBorderColor(color: Color.signPrimary)
            button.backgroundColor = Color.signRadio
            button.configuration?.baseForegroundColor = .black
        } else {
            button.isSelected = false
            button.setBorderColor(color: Color.signGrey)
            button.backgroundColor = .clear
            button.configuration?.baseForegroundColor = .gray
        }
    }
    
    // MARK: IBActions
    // Change Profile Image
    @IBAction func btnImgChangeTapped(_ sender: UIButton) {
        openPickerView(sender)
    }
    
    // User Type Selection
    @IBAction func btnUserTypeTapped(_ sender: UIButton) {
        if sender == btnTraveler {
            btnTraveler.isSelected = true
            isButtonSelected(button: btnTraveler, isSelect: true)
            btnLocal.isSelected = false
            isButtonSelected(button: btnLocal, isSelect: false)
        } else {
            btnLocal.isSelected = true
            isButtonSelected(button: btnLocal, isSelect: true)
            btnTraveler.isSelected = false
            isButtonSelected(button: btnTraveler, isSelect: false)
        }
    }
    
    // Gender Selection
    @IBAction func btnGenderTapped(_ sender: UIButton) {
        if sender == btnMale {
            btnMale.isSelected = true
            isButtonSelected(button: btnMale, isSelect: true)
            btnFemale.isSelected = false
            isButtonSelected(button: btnFemale, isSelect: false)
        } else {
            btnFemale.isSelected = true
            isButtonSelected(button: btnFemale, isSelect: true)
            btnMale.isSelected = false
            isButtonSelected(button: btnMale, isSelect: false)
        }
    }
    
    // Open Collection view for interest
    @IBAction func btnNextTapped(_ sender: UIButton) {
        guard let viewController = UIStoryboard(name: "SignUP", bundle: nil).instantiateViewController(withIdentifier: InterestsViewController.identifier) as? InterestsViewController else { return }
        viewController.delegate = self
        viewController.clcview = selectInterestClcView
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}

// MARK: Extension For InterestsViewControllerProtocol
extension SignUPViewController: InterestsViewControllerProtocol {
    
    func sendSelectItem(items: [String]) {
        selectInterest = items
    }
    
}

// MARK: Extension For UITextViewDelegate
extension SignUPViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        let numberOfLines = textView.contentSize.height / (textView.font?.lineHeight ?? 1)
        if Int(numberOfLines) < 3 {
            txtViewBioHeight.constant = 60.0
            txtViewiceBreakerHeight.constant = 60.0
        } else if Int(numberOfLines) < 5 {
            txtViewBioHeight.constant = txtViewBio.contentSize.height
            txtViewiceBreakerHeight.constant = txtViewIceBreaker.contentSize.height
        } else {
            txtViewBioHeight.constant = 72
            txtViewiceBreakerHeight.constant = 72
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if((textView.text == Constant.String.txtBioPlace || (textView.text == Constant.String.txtIceBreakerPlace)) && textView.textColor == .lightGray) {
            textView.text = ""
            textView.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if(textView.text.isEmpty) {
            txtViewBio.text = Constant.String.txtBioPlace
            txtViewIceBreaker.text = Constant.String.txtIceBreakerPlace
            textView.textColor = .lightGray
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        btnSubmit.isEnabled = checkValidation()
        return true
    }
    
}

// MARK: Extension For UITextFieldDelegate
extension SignUPViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == txtDOB || textField ==
            txtCountry {
            return false
        }
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        btnSubmit.isEnabled = checkValidation()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case txtName:
            txtEmail.becomeFirstResponder()
        case txtEmail:
            txtViewBio.becomeFirstResponder()
        case txtDOB:
            txtCountry.becomeFirstResponder()
        case txtCountry:
            txtHometown.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        return true
    }
    
}

// MARK: Extension For UIPickerViewDelegate
extension SignUPViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        PickerModel.country.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        PickerModel.country[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        txtCountry.text = PickerModel.country[row]
        txtCountry.resignFirstResponder()
    }
    
}

// MARK: Extension For UICollectionViewDelegate
extension SignUPViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return selectInterest.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SelectInterestCell.identifier, for: indexPath) as? SelectInterestCell else {
            return UICollectionViewCell()
        }
        cell.setCellData(data: selectInterest[indexPath.row])
        return cell
    }
    
}

// MARK: Extension For UICollectionViewDelegateFlowLayout
extension SignUPViewController: UICollectionViewDelegateFlowLayout {

    /// Flow layout set to automatic for width
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let size = CGSize(width: 100, height: CellConst.cellheight)
//        return size
//    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        CellConst.itemSpace
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        CellConst.lineSpace
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: CellConst.topC, left: CellConst.leftC, bottom: CellConst.bottomC, right: CellConst.rightC)
    }
    
}
