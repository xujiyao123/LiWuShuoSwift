//
//  HomeContentViewController.swift
//  LiWuShuoSwift
//
//  Created by 徐继垚 on 15/9/25.
//  Copyright © 2015年 徐继垚. All rights reserved.
//

import UIKit

class HomeContentViewController: UIViewController {

    var webUrl: String?
    
    var web: UIWebView?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        web = UIWebView(frame: UIScreen.mainScreen().bounds)
        
        let request = NSURLRequest(URL: NSURL(string: webUrl!)!)
        
        web?.loadRequest(request)
        
        self.view.addSubview(web!)
        

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
