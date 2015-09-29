//
//  MainNavigationController.swift
//  LiWuShuoSwift
//
//  Created by 徐继垚 on 15/9/29.
//  Copyright © 2015年 徐继垚. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.tintColor = UIColor.whiteColor()

        let attributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
        self.navigationBar.titleTextAttributes = attributes
        // Do any additional setup after loading the view.
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
