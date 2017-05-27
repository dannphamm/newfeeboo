//
//  AccountListsViewController.swift
//  FeeBoo
//
//  Created by Dung Pham on 5/24/17.
//  Copyright © 2017 Dung Pham. All rights reserved.
//

import UIKit

class AccountListsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func logoutTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
