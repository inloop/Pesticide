//
//  UIView+Pesticide.swift
//  TestViewHierarchy
//
//  Created by Elias Bagley on 11/21/14.
//  Copyright (c) 2014 Rocketmade. All rights reserved.
//

import Foundation
import UIKit

var kAlphaAssociationKey = "kAlphaAssociationKey"
var kBorderWidthAssociationKey = "kBorderWidthAssociationKey"
var kUserInteractionAssociationKey = "kUserInteractionAssociationKey"
var kBorderColorAssociationKey = "kBorderColorAssociationKey"

extension UIView {
    func allSubviewsInvisble() -> Bool {
        if (subviews.count == 0) {
            return true
        }

        for subview in subviews {
            if subview.alpha != 0 {
                return false
            }
        }

        return true
    }

    // This doesn't seem to always work..
    func deepCopy() -> UIView {
        let data = NSKeyedArchiver.archivedData(withRootObject: self)
        return (NSKeyedUnarchiver.unarchiveObject(with: data) as? UIView) ?? UIView()
    }

}

// properties
extension UIView {
//    var defaultBorderWidth:Float {
//        get {
//            return objc_getAssociatedObject(self, &kBorderWidthAssociationKey) as! Float
//        }
//        set(newValue) {
//            objc_setAssociatedObject(self, &kBorderWidthAssociationKey, newValue, UInt(OBJC_ASSOCIATION_COPY))
//        }
//    }
//
//    var defaultAlpha:Float {
//        get {
//            return objc_getAssociatedObject(self, &kAlphaAssociationKey) as! Float
//        }
//        set(newValue) {
//            objc_setAssociatedObject(self, &kAlphaAssociationKey, newValue, UInt(OBJC_ASSOCIATION_COPY))
//        }
//    }
//
//    var defaultUserInteractionBool:Bool {
//        get {
//            return objc_getAssociatedObject(self, &kUserInteractionAssociationKey) as! Bool
//        }
//        set(newValue) {
//            objc_setAssociatedObject(self, &kUserInteractionAssociationKey, newValue, UInt(OBJC_ASSOCIATION_COPY))
//        }
//    }
//
//    var defaultBorderColor:UIColor {
//        get {
//            return objc_getAssociatedObject(self, &kBorderColorAssociationKey) as! UIColor
//        }
//        set(newValue) {
//            objc_setAssociatedObject(self, &kBorderColorAssociationKey, newValue, UInt(OBJC_ASSOCIATION_COPY))
//        }
//    }

    func saveDefaults() {
//        self.defaultAlpha = Float(self.alpha)
//        self.defaultUserInteractionBool = self.userInteractionEnabled
//        self.defaultBorderWidth = Float(self.layer.borderWidth)
////        self.defaultBorderColor = UIColor(CGColor:self.layer.borderColor)!
    }
//
    func restoreDefaults() {
//        self.alpha = CGFloat(self.defaultAlpha)
//        self.userInteractionEnabled = self.defaultUserInteractionBool
//        self.layer.borderWidth = CGFloat(self.defaultBorderWidth)
//        self.layer.borderColor = self.defaultBorderColor.CGColor
    }
}
