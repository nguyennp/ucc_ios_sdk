//
//  TabContactsViewController.swift
//  VNPTVideoCallSample
//
//  Created by Hieu Tran on 10/23/20.
//

import UIKit
import EmptyDataSet_Swift
import VNPTVideoCallSDK

class TabContactsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            self.tableView.dataSource = self
            self.tableView.delegate = self
            self.tableView.rowHeight = UITableView.automaticDimension
            self.tableView.estimatedRowHeight = 300
            
            if #available(iOS 11, *) {
                self.tableView.estimatedSectionHeaderHeight = UITableView.automaticDimension
            }
            
            self.tableView.register(UINib(nibName: "PersonViewCell", bundle: nil), forCellReuseIdentifier: "PersonViewCell")
            
            self.tableView.emptyDataSetSource = self
            self.tableView.emptyDataSetDelegate = self
        }
    }
    let refreshControl = UIRefreshControl()
    var dataSource : [Person]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.makeup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
        self.title = "Contacts"
        self.loadData()
    }
    
}

//MARK: View
extension TabContactsViewController {
    func makeup() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(actBtnAdd))
        
        self.refreshControl.addTarget(self, action: #selector(self.refreshData), for: .valueChanged)
        self.tableView.refreshControl = self.refreshControl
    }
    
    func loadData() {
        self.dataSource = UserDefaultsRepo.getDanhBa()
        self.reShow()
    }
    
    func reShow() {
        guard self.isViewLoaded else { return } //Return if view not ready yet, avoid crash app
        self.tableView.reloadData()
        self.showRefreshControl(active: false)
    }
    
    func showRefreshControl(active: Bool) {
        if active {
            if self.refreshControl.isRefreshing {
                return
            }
            self.refreshControl.beginRefreshing()
            let newOffset = CGPoint(x: 0, y: -80)
            self.tableView.setContentOffset(newOffset, animated: true)
        } else {
            self.refreshControl.endRefreshing()
        }
    }
    
    @objc func reloadData() {
        self.refreshControl.beginRefreshing()
        self.loadData()
    }
    
    @objc func refreshData() {
        if self.refreshControl.isRefreshing {
            self.loadData()
        }
    }
    
    @objc func actBtnAdd() {
        let vc = AddNewPersonViewController()
        vc.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        vc.modalPresentationStyle = UIModalPresentationStyle.overFullScreen
        vc.onSaveSuccess = { (data) in
            MyAlert.shared.showAlertWithSnackBar("Thêm mới liên hệ thành công")
            self.loadData()
        }
        self.present(vc, animated: true)
    }
}

//MARK: UITableViewDelegate
extension TabContactsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let data = self.dataSource else {
            return 0
        }
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonViewCell", for: indexPath) as! PersonViewCell
        let item = self.dataSource![indexPath.row]
        cell.lblName.text = item.HO_TEN.uppercased()
        cell.lblRelationship.text = item.QUAN_HE
        
        cell.lblAva.text = item.HO_TEN[0].uppercased()
        
        cell.btnVideoCall.addTarget(self, action: #selector(actBtnVideoCall), for: .touchUpInside)
        cell.btnVideoCall.tag = indexPath.row
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        // action two
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Xoá", handler: { (action, indexPath) in
            if let item = self.dataSource?[indexPath.row] {
                self.dataSource?.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                
                if var data = UserDefaultsRepo.getDanhBa() {
                    data.removeAll(where: {$0.uuid == item.uuid})
                    UserDefaultsRepo.save(danhBa: data)
                }
            }
            if self.dataSource!.isEmpty {
                tableView.reloadData()
            }
        })

        return [deleteAction]
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = self.dataSource![indexPath.row]
        let vc = AddNewPersonViewController()
        vc.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        vc.modalPresentationStyle = UIModalPresentationStyle.overFullScreen
        vc.person = item
        vc.onSaveSuccess = { (data) in
            MyAlert.shared.showAlertWithSnackBar("Chỉnh sửa liên hệ thành công")
            self.loadData()
        }
        self.present(vc, animated: true)
    }
    
    @objc func actBtnVideoCall(_ sender: UIButton) {
        let row = sender.tag
        let item = self.dataSource![row]
        if let caller = VNPTMeet.shared.personIdApp {
            let additionalData = ["abd": 123, "bdn": "456"] as [String : Any]
            VNPTMeet.shared.outgoingCall(caller: caller, roomName: item.HO_TEN, item.DEVICE_ID, additionalData: additionalData)
        } else {
            self.tabBarController?.selectedIndex = 2
        }
    }
}

//MARK: EmptyDataSetDelegate
extension TabContactsViewController : EmptyDataSetDelegate {
    
    /// Asks the delegate to know if the empty dataset should be rendered and displayed. Default is true.
    func emptyDataSetShouldDisplay(_ scrollView: UIScrollView) -> Bool {
        return self.dataSource == nil || self.dataSource!.isEmpty
    }
    
    /// Asks the delegate for scroll permission. Default is false.
    func emptyDataSetShouldAllowScroll(_ scrollView: UIScrollView) -> Bool {
        return true
    }
    
    /// Tells the delegate that the action button was tapped.
    func emptyDataSet(_ scrollView: UIScrollView, didTapButton button: UIButton) {
        self.actBtnAdd()
    }
}

//MARK: EmptyDataSetSource
extension TabContactsViewController : EmptyDataSetSource {
    
    /// Asks the data source for the title of the dataset.
    func title(forEmptyDataSet scrollView: UIScrollView) -> NSAttributedString? {
        return NSAttributedString(string: "Bạn chưa có danh bạ nào", attributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15.0) as Any,
                NSAttributedString.Key.foregroundColor: UIColor.darkText
            ]
        )
    }
    
    /// Asks the data source for the description of the dataset.
    func description(forEmptyDataSet scrollView: UIScrollView) -> NSAttributedString? {
        return NSAttributedString(string: "Thực hiện thêm danh bạ ngay bây giờ",
                                  attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13.0) as Any,
                                               NSAttributedString.Key.foregroundColor: UIColor.gray])
    }
    
    /// Asks the data source for the title to be used for the specified button state.
    func buttonTitle(forEmptyDataSet scrollView: UIScrollView, for state: UIControl.State) -> NSAttributedString? {
        scrollView.delaysContentTouches = false
        if state == .normal {
            return NSAttributedString(string: "Thêm danh bạ", attributes: [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15.0) as Any,
                NSAttributedString.Key.foregroundColor: UIColor.systemBlue
            ])
        }
        
        return NSAttributedString(string: "Thêm danh bạ", attributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15.0) as Any,
            NSAttributedString.Key.foregroundColor: UIColor.darkText
        ])
    }
    
    /// Asks the data source for the image of the dataset.
    func image(forEmptyDataSet scrollView: UIScrollView) -> UIImage? {
        return UIImage(named: "empty_data.medial_history")
    }
}

