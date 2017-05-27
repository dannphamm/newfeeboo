//
//  SelectUsersViewController.swift
//  FeeBoo
//
//  Created by Dung Pham on 5/27/17.
//  Copyright © 2017 Dung Pham. All rights reserved.
//

import UIKit

class SelectUsersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        tableView(<#T##tableView: UITableView##UITableView#>, numberOfRowsInSection: <#T##Int#>)
        
        tableView(<#T##tableView: UITableView##UITableView#>, cellForRowAt: <#T##IndexPath#>)
        
        
    }
}
