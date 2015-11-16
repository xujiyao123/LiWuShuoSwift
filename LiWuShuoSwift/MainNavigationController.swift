//
//  MainNavigationController.swift
//  LiWuShuoSwift
//
//  Created by 徐继垚 on 15/9/29.
//  Copyright © 2015年 徐继垚. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController ,UIGestureRecognizerDelegate{
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
   override func preferredStatusBarUpdateAnimation() -> UIStatusBarAnimation {
        return UIStatusBarAnimation.Fade
    }
//   override func prefersStatusBarHidden() -> Bool {
//        return true
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.tintColor = UIColor.whiteColor()

        let attributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
        self.navigationBar.titleTextAttributes = attributes
        // Do any additional setup after loading the view.
        
        
        let target = self.interactivePopGestureRecognizer?.delegate
        let pan = UIPanGestureRecognizer(target: target, action: Selector("handleNavigationTransition:"))
        pan.delegate = self
        self.view.addGestureRecognizer(pan)
        self.interactivePopGestureRecognizer?.enabled = false
        
        
    }
    func handleNavigationTransition(pan: UIPanGestureRecognizer) {
    
    }
    func gestureRecognizerShouldBegin(gestureRecognizer: UIGestureRecognizer) -> Bool {
        if self.childViewControllers.count == 1 {
            return false
        }
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
