//
//  CustomImageButton.swift
//  NSCollectionViewDemo
//
//  Created by sycf_ios on 2017/12/18.
//  Copyright © 2017年 sycf_ios. All rights reserved.
//

import Cocoa

class CustomImageButton: NSButton {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        layer?.cornerRadius = dirtyRect.width / 2
        layer?.masksToBounds = true
        // Drawing code here.
    }
    
}
