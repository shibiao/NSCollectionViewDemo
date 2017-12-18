//
//  ViewController.swift
//  NSCollectionViewDemo
//
//  Created by sycf_ios on 2017/12/15.
//  Copyright © 2017年 sycf_ios. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    static let itemIdentifier = "UserItem"
    let layout = NSCollectionViewFlowLayout()
    @IBOutlet weak var collectionView: NSCollectionView!
    var flag: Bool = false
    var data = Array<Any>()
    override func viewDidLoad() {
        super.viewDidLoad()
//        guard let tmpNib = NSNib(nibNamed: NSNib.Name(rawValue: "UserItem"), bundle: nil) else {return}
        
        collectionView.register(NSNib(nibNamed: NSNib.Name.init("UserItem"), bundle: nil), forItemWithIdentifier: NSUserInterfaceItemIdentifier.init(ViewController.itemIdentifier))
        
        layout.itemSize = NSMakeSize(300, 300)
        collectionView.collectionViewLayout = layout
        data = [
            "1",
            "2",
            "1",
            "2",
            ]
        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}
extension ViewController: NSCollectionViewDelegate, NSCollectionViewDataSource {
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let item = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: ViewController.itemIdentifier), for: indexPath) as! UserItem
        item.handleCallUser { (button) in
            print(indexPath.item)
            self.refreshItem(item, at: indexPath)
        }
        item.userAvatar.image = NSImage(named: NSImage.Name.init(data[indexPath.item] as! String))
        return item
    }
    func refreshItem(_ item: NSCollectionViewItem, at indexPath: IndexPath) {
        
        flag = !flag

//        NSAnimationContext.runAnimationGroup({ (context) in
//
//            context.duration = 3
//
//            context.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
//
//            if self.flag {
//
//                self.layout.itemSize = NSMakeSize(40, 40)
//
//            }else {
//
//                self.layout.itemSize = NSMakeSize(300, 300)
//            }
//
//        }, completionHandler: nil)
        if self.flag {
            //            item.view.setFrameSize(NSMakeSize(40, 40))
            layout.itemSize = NSMakeSize(40, 40)
            self.collectionView.reloadData()
        }else {
            for i in 0...3 {
                //                let indexPath = IndexPath(item: i, section: 0)
                let tempItem = self.collectionView.item(at: i)
                if item != tempItem {
                    tempItem?.view.isHidden = true
                }
            }
            
            item.view.setFrameSize(NSMakeSize(300, 300))
            item.view.setFrameOrigin(NSMakePoint(0, 0))
            item.view.centerScanRect(collectionView.bounds)
            
        }
        item.view.setNeedsDisplay(self.collectionView.bounds)
        self.collectionView.animator().setNeedsDisplay(self.view.bounds)

        print(NSStringFromRect(item.view.frame))

        collectionView.scrollToItems(at: [indexPath], scrollPosition: NSCollectionView.ScrollPosition.centeredVertically)
//        collectionView.reloadItems(at: [indexPath])
//        collectionView.reloadData()
    }

}
