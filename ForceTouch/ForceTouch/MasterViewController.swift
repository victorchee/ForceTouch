//
//  MasterViewController.swift
//  ForceTouch
//
//  Created by qihaijun on 11/12/15.
//  Copyright © 2015 VictorChee. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController, UIViewControllerPreviewingDelegate {
    
    @IBOutlet weak var forceTouchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Check 3D touch available
        if traitCollection.forceTouchCapability == .Available {
            // force touch avaiable
            registerForPreviewingWithDelegate(self, sourceView: forceTouchButton)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func traitCollectionDidChange(previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if traitCollection.forceTouchCapability == .Available {
            // force touch avaiable
            registerForPreviewingWithDelegate(self, sourceView: forceTouchButton)
        }
    }
    
    func previewingContext(previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        // Check if already displaying a preview controller
        if let presented = presentedViewController {
            if presented is DetailViewController {
                return nil
            }
        }
        
        // Peek (shallow press)
        let detailViewcontroller = storyboard?.instantiateViewControllerWithIdentifier("DetailViewController") as? DetailViewController
        return detailViewcontroller
    }
    
    func previewingContext(previewingContext: UIViewControllerPreviewing, commitViewController viewControllerToCommit: UIViewController) {
        // Pop (deep press)
        showViewController(viewControllerToCommit, sender: self)
    }
}

