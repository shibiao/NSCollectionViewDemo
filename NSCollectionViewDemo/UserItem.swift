//
//  UserItem.swift
//  NSCollectionViewDemo
//
//  Created by sycf_ios on 2017/12/18.
//  Copyright © 2017年 sycf_ios. All rights reserved.
//

import Cocoa

class UserItem: NSCollectionViewItem {
    
    typealias UserBlock = (_ sender: Any) -> Void
    var callUser: UserBlock?
    @IBOutlet weak var userAvatar: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func handleUserAvatar(_ sender: Any) {
        if let tmpCallUser = callUser {
            tmpCallUser(sender)
        }
    }
    func handleCallUser(block: @escaping UserBlock) {
        callUser = block
    }
    
}
