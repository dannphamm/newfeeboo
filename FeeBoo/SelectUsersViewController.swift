//
//  SelectUsersViewController.swift
//  FeeBoo
//
//  Created by Dung Pham on 5/27/17.
//  Copyright © 2017 Dung Pham. All rights reserved.
//

import UIKit
import  Firebase

class SelectUsersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var users : [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        Database.database().reference().child("users").observe(DataEventType.childAdded, with: {(snapshot) in
            print(snapshot)
            
           
    
            let user = User()
            user.email = snapshot.value["email"] as! String
            user.uid = (snapshot.value! as AnyObject).key!
            
        
            self.users.append(user)
            
            self.tableView.reloadData()
        
        })
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  UITableViewCell()
        
        let user = users[indexPath.row]
        
        cell.textLabel?.text = user.email
        
        return cell
    }
    
    }

