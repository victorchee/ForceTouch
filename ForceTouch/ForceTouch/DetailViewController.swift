//
//  DetailViewController.swift
//  ForceTouch
//
//  Created by qihaijun on 11/12/15.
//  Copyright © 2015 VictorChee. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    override func previewActionItems() -> [UIPreviewActionItem] {
        super.previewActionItems()
        
        let defaultAction = UIPreviewAction(title: "Default Action", style: UIPreviewActionStyle.Default) { (action, previewViewController) -> Void in
            print("Default action triggered")
        }
        
        let destructiveAction = UIPreviewAction(title: "Destructive Action", style: .Destructive) { (action, previewViewController) -> Void in
            print("Destructive action triggered")
        }
        
        let actionGroup = UIPreviewActionGroup(title: "Action Group", style: .Default, actions: [defaultAction, destructiveAction])
        
        return [defaultAction, destructiveAction, actionGroup]
    }
}
