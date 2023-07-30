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
    @IBOutlet weak var msgView: UIView!
    @IBOutlet weak var txtViewMsgBottom: NSLayoutConstraint!
    
    private enum Const {
        static let heightForheder = 56.0
    }
    
    // MARK: Variables
    /// Model group by time
    lazy var groupByTime = Dictionary(grouping: ChatModel.data, by: { (date) -> String in
        let date = Date(timeIntervalSince1970: date.time)
        return date.getFormattedDate()
    })
    /// Array of keys
    lazy var arrayOfDate: [String] = groupByTime.map { $0.key }.sorted(by: <)
        
    lazy var lastSection = tblChat.numberOfSections - 1
    lazy var lastRow = tblChat.numberOfRows(inSection: lastSection) - 1
    
    
    // MARK: View Controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setNavigationBar()
        setTxtViewMsg()
        setTableView()
        print(arrayOfDate)
    }

    // MARK: SetUp Views
    private func setupViews() {
        tblChat.register(UINib(nibName: LeftViewCell.identifier, bundle: nil), forCellReuseIdentifier: LeftViewCell.identifier)
        tblChat.register(UINib(nibName: RightViewCell.identifier, bundle: nil), forCellReuseIdentifier: RightViewCell.identifier)
        tblChat.register(UINib(nibName: LeftImageCell.identifier, bundle: nil), forCellReuseIdentifier: LeftImageCell.identifier)
        tblChat.register(UINib(nibName: RightImageCell.identifier, bundle: nil), forCellReuseIdentifier: RightImageCell.identifier)
        tblChat.register(UINib(nibName: ChatSectionHeader.identifier, bundle: nil), forHeaderFooterViewReuseIdentifier: ChatSectionHeader.identifier)
        addKeyBoardNotificationChangeObserver(txtViewMsgBottom)
        hideKeyboard()
    }
    
    // MARK: Setup NavigationBar
    private func setNavigationBar() {
        title = Constant.String.chatScreenTitle.uppercased()
        
        /// Set back Icon
        navigationController?.navigationBar.backIndicatorImage = UIImage(named: Image.chatBack)
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: Image.chatBack)
        
        /// Set Right Icon
        let imageView = UIImageView(image: UIImage(named: Image.imgReceiver))
        imageView.contentMode = .scaleAspectFit
        let item = UIBarButtonItem(customView: imageView)
        navigationItem.rightBarButtonItem = item
        
        navigationController?.navigationBar.barTintColor = Color.mainBackground
    }
    
    // MARK: Setup TextView
    private func setTxtViewMsg() {
        msgView.setCornerRadius(radius: 4)
        
        txtViewMsg.delegate = self
        txtViewMsg.backgroundColor = Color.txtMsg
        txtViewMsg.text = Constant.String.placeHolderTxt
        txtViewMsg.textColor = .lightGray
        txtViewMsg.returnKeyType = .done
    }
    
    // MARK: Setup TableView
    private func setTableView() {
        tblChat.delegate = self
        tblChat.dataSource = self
        tblChat.backgroundColor = Color.mainBackground
        tblChat.allowsSelection = false
        tblChat.separatorStyle = .none
        tblChat.showsVerticalScrollIndicator = false
        tblChat.scrollToRow(at: IndexPath(row: lastRow, section: lastSection), at: .bottom, animated: true)
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
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if(txtViewMsg.text.isEmpty) {
            txtViewMsg.text = Constant.String.placeHolderTxt
            txtViewMsg.textColor = .lightGray
        }
    }
    
}

// MARK: Extension For TableView
extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return groupByTime.keys.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupByTime[arrayOfDate[section]]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let data = groupByTime[arrayOfDate[indexPath.section]] else { return UITableViewCell() }
        
        let messenger = data[indexPath.row].messenger
        let msgType = data[indexPath.row].textMessage

        switch messenger {
        case .sender:
            
            switch msgType {
            case .text(_):
                guard let cell = tableView.dequeueReusableCell(withIdentifier: RightViewCell.identifier, for: indexPath) as? RightViewCell else {
                    return UITableViewCell()
                }
                cell.setRightCellData(chat: data[indexPath.row])
                return cell
                
            case .image(_):
                guard let cell = tableView.dequeueReusableCell(withIdentifier: RightImageCell.identifier, for: indexPath) as? RightImageCell else {
                    return UITableViewCell()
                }
                cell.setRightCellData(chat: data[indexPath.row])
                return cell
            }

        case .receiver:
            
            switch msgType {
            case .text(_):
                guard let cell = tableView.dequeueReusableCell(withIdentifier: LeftViewCell.identifier, for: indexPath) as? LeftViewCell else {
                    return UITableViewCell()
                }
                cell.setLeftCellData(chat: data[indexPath.row])
                return cell
                
            case .image(_):
                guard let cell = tableView.dequeueReusableCell(withIdentifier: LeftImageCell.identifier, for: indexPath) as? LeftImageCell else {
                    return UITableViewCell()
                }
                cell.setRightCellData(chat: data[indexPath.row])
                return cell
            }
        }
    
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: ChatSectionHeader.identifier) as? ChatSectionHeader else {
            return UIView()
        }
        headerView.setHederTitle(title: arrayOfDate[section])
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        Const.heightForheder
    }
    
}
