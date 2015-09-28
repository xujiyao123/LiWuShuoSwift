//
//  HomeWebViewController.swift
//  LiWuShuoSwift
//
//  Created by 徐继垚 on 15/9/28.
//  Copyright © 2015年 徐继垚. All rights reserved.
//

import UIKit

class HomeWebViewController: UIViewController {

    var url: NSURL?
    
    var web : UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.title = "网页"
        
         let request = NSURLRequest(URL: url!)
        
        web = UIWebView(frame: CGRectMake(0, 0, ScreenWidht, ScreenHight - 64))
        
        web.loadRequest(request)
        
        
        self.view.addSubview(web)
        
        
        
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
