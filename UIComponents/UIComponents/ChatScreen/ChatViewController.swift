//
//  ChatViewController.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 31/05/23.
//

import UIKit

class ChatViewController: BaseViewController {
    
    // MARK: IBOutlets
    @IBOutlet weak var tblChat: UITableView!
    @IBOutlet weak var txtViewMsg: UITextView!
    @IBOutlet weak var txtViewMsgHeight: NSLayoutConstraint!
    @IBOutlet weak var btnAttch: UIButton!
    @IBOutlet weak var btnSend: UIButton!
    
    // MARK: View Controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setNavigationBar()
        setTxtViewMsg()
        setTableView()
    }

    // MARK: SetUp Views
    private func setupViews() {
        tblChat.register(UINib(nibName: LeftViewCell.identifier, bundle: nil), forCellReuseIdentifier: LeftViewCell.identifier)
        tblChat.register(UINib(nibName: RightViewCell.identifier, bundle: nil), forCellReuseIdentifier: RightViewCell.identifier)
    }
    
    // MARK: Setup NavigationBar
    private func setNavigationBar() {
        title = "pontus gager"
        navigationController?.navigationBar.backIndicatorImage = UIImage(named: Image.chatBack)
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: Image.chatBack)
        
        let imageView = UIImageView(image: UIImage(named: Image.imgprofile2))
        imageView.contentMode = .scaleAspectFit
        let item = UIBarButtonItem(customView: imageView)
        navigationItem.rightBarButtonItem = item
        
        navigationController?.navigationBar.barTintColor = Color.mainBackground
    }
    
    // MARK: Setup TextView
    private func setTxtViewMsg() {
        txtViewMsg.delegate = self
        txtViewMsg.backgroundColor = Color.txtMsg
        txtViewMsg.text = Constant.String.placeHolderTxt
        txtViewMsg.textColor = .lightGray
    }
    
    // MARK: Setup TableView
    private func setTableView() {
        tblChat.delegate = self
        tblChat.dataSource = self
        tblChat.backgroundColor = Color.mainBackground
        tblChat.allowsSelection = false
        tblChat.separatorStyle = .none
    }
    
}

// MARK: Extension For UITextViewDelegate
extension ChatViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        let numberOfLines = textView.contentSize.height / (textView.font?.lineHeight ?? 1)
        if Int(numberOfLines) < 6 {
            txtViewMsgHeight.constant = txtViewMsg.contentSize.height
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if(txtViewMsg.text == Constant.String.placeHolderTxt && txtViewMsg.textColor == .lightGray) {
            txtViewMsg.text = ""
            txtViewMsg.textColor = .black
        }
        textView.becomeFirstResponder()
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if(txtViewMsg.text.isEmpty) {
            txtViewMsg.text = Constant.String.placeHolderTxt
            txtViewMsg.textColor = .lightGray
        }
        textView.resignFirstResponder()
    }
    
}

// MARK: Extension For TableView
extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ChatModel.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = ChatModel.data[indexPath.row].messenger
        
        switch row {
        case .sender:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: RightViewCell.identifier, for: indexPath) as? RightViewCell else {
                return UITableViewCell()
            }
            cell.setRightCellData(chat: ChatModel.data[indexPath.row])
            return cell
        case .receiver:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: LeftViewCell.identifier, for: indexPath) as? LeftViewCell else {
                return UITableViewCell()
            }
            cell.setLeftCellData(chat: ChatModel.data[indexPath.row])
            return cell
        }
    
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    
}
