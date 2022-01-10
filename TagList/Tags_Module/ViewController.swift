//
//  ViewController.swift
//  TagList
//
//  Created by Kishor on 12/2/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var data = StructData.data
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpTableView()
        reloadTableViewDelay()
        self.addNavigationBarButtons()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.title = "Tags"
    }
    
    fileprivate func setUpTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.estimatedRowHeight = 30
        self.tableView.backgroundColor = .clear
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        self.tableView.contentInset = UIEdgeInsets.zero
        //self.tableView.separatorColor = .clear//tableViewSeperatorColor
    }
    
    fileprivate func reloadTableViewDelay() {
        self.perform(#selector(reloadTable), with: nil, afterDelay: 0.1)
    }
    
    @objc private func reloadTable() {
        self.tableView.reloadData()
    }
    
    fileprivate func addNavigationBarButtons() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTapped))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Remove", style: .plain, target: self, action: #selector(removeTapped))
    }
    
    @objc fileprivate func addTapped() {
        self.data.append("Kishor")
        reloadTableViewDelay()
    }
    
    @objc fileprivate func removeTapped() {
        self.data.removeLast()
        reloadTableViewDelay()
    }
}

//MARK:- UITableViewDelegate and DataSource
extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "TagListCell"
        var cell: TagListCell! = tableView.dequeueReusableCell(withIdentifier: identifier) as? TagListCell
        if cell == nil {
            tableView.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
            cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? TagListCell
        }
        cell.selectionStyle = .none
        cell.frame = tableView.bounds
        cell.setData(data: self.data)
        cell.tagListCollection.reloadData()
        return cell
    }
}


//MARK:- Set Dummy Data
struct StructData {
    static var data = ["Kishor", "iOS", "Developer", "Software Engineer", "ABCI", "Coding", "Xcode", "I am a GEEKY","JKLMNO" , "Testing Coding", "Development", "XYZ-XYZ-XYZCD", "Enable the Tag Layout", "Layouts Arrangement"]
}
