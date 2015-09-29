//
//  HomeContentViewController.swift
//  LiWuShuoSwift
//
//  Created by 徐继垚 on 15/9/25.
//  Copyright © 2015年 徐继垚. All rights reserved.
//

import UIKit

class HomeContentViewController: UIViewController , UIScrollViewDelegate , UIWebViewDelegate{

    var webUrl: String?
    
    var cover_image : String?
    
    var web: UIWebView?
    
    var coverImageView : UIImageView?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
               
        self.title = "攻略详情"
 
        
        web = UIWebView(frame: CGRectMake(0, 0, ScreenWidht, ScreenHight - 64))
        web?.backgroundColor = UIColor.whiteColor()
        web?.scrollView.backgroundColor = UIColor.whiteColor()
        web?.scrollView.contentInset = UIEdgeInsetsMake(200, 0, 0, 0)

        web?.delegate = self
        web?.scrollView.delegate = self
        let request = NSURLRequest(URL: NSURL(string: webUrl!)!)
        web?.loadRequest(request)
        
        self.view.addSubview(web!)
        
        coverImageView = UIImageView(frame: CGRectMake(0, -200, ScreenWidht, 200))
        coverImageView?.sd_setImageWithURL(NSURL(string: cover_image!))
        coverImageView?.contentMode = UIViewContentMode.ScaleAspectFill
        coverImageView?.clipsToBounds = true
        coverImageView?.backgroundColor = UIColor.whiteColor()
        web?.scrollView.addSubview(coverImageView!)

        // Do any additional setup after loading the view.
    }
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        let  content = scrollView.contentOffset.y;
        if (content < -200) {
            var newFrame = self.coverImageView!.frame;
            newFrame.origin.y = content;
            newFrame.size.height = -content;
            self.coverImageView!.frame = newFrame;
        }
        
        
        
    }
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        if (navigationType == UIWebViewNavigationType.LinkClicked) {
            let clickURL = request.URL;
           
            web?.stopLoading()
            let vc = HomeWebViewController()
            vc.url = clickURL
            self.navigationController?.pushViewController(vc, animated: true)
           
            
            
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
