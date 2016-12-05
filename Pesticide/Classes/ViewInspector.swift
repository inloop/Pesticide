//
//  ViewInspector.swift
//  TestViewHierarchy
//
//  Created by Elias Bagley on 11/21/14.
//  Copyright (c) 2014 Rocketmade. All rights reserved.
//

import Foundation
import UIKit

class ViewInspector {
    fileprivate var removedViews: [UIView] = []
    var root: UIView

    init(rootView: UIView) {
        root = rootView
        recurseThroughSubviews(rootView)
    }

    func recurseThroughSubviews(_ rootView: UIView) {
        // save default values
        rootView.saveDefaults()

        rootView.layer.borderWidth = 2.0
        rootView.layer.borderColor = UIColor.red.cgColor
        rootView.isUserInteractionEnabled = true

        addDeleteBlock(rootView)

        for subview in rootView.subviews {
            recurseThroughSubviews(subview)
        }
    }

    func addDeleteBlock(_ view: UIView) {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewInspector.handleTap(_:)))
        view.addGestureRecognizer(tapGesture)
    }

    @objc func handleTap(_ tapGesture: UITapGestureRecognizer) {
        let view = tapGesture.view!
        if (view.allSubviewsInvisble()) {
            removedViews.append(view)
            view.alpha = 0
            view.isUserInteractionEnabled = false
        }
    }

    @objc func undo() {
        if (removedViews.count > 0) {
            let last = removedViews.removeLast()
            last.restoreDefaults()
            last.isUserInteractionEnabled = true
        }
    }

    func undoAll() {
        while (removedViews.count > 0) {
            undo()
        }
    }

    // call this to return view hierarchy to original
    func done() {
        done(root)
    }

    func done(_ rootView: UIView) {
        rootView.restoreDefaults()

        for subview in rootView.subviews {
            done(subview)
        }
    }

}