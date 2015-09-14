//
//  HomeViewController.swift
//  LiWuShuoSwift
//
//  Created by 徐继垚 on 15/9/14.
//  Copyright © 2015年 徐继垚. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
          
         self.navigationController?.navigationBar.barTintColor = NavColor
        let titleLabel = UILabel(frame: CGRectMake(10, 0, 120, 44))
        titleLabel.textColor = UIColor.whiteColor()
        titleLabel.textAlignment = NSTextAlignment.Center
        titleLabel.text = "礼物说"
        self.navigationItem.titleView = titleLabel
        
        
        
        
        
        
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
