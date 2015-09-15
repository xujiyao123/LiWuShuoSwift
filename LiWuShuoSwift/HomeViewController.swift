//
//  HomeViewController.swift
//  LiWuShuoSwift
//
//  Created by 徐继垚 on 15/9/14.
//  Copyright © 2015年 徐继垚. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController,UITableViewDataSource ,UITableViewDelegate ,UIScrollViewDelegate {
    
    var seg : SegView!
    var mainScrollView :UIScrollView!
    var mainTableView : UITableView!
    var subtableView1 : UITableView!
    var subtableView2 : UITableView!
    var subtableView3 : UITableView!
    var subtableView4 : UITableView!
    var subtableView5 : UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
          
        self.didLoadView()
        
        // Do any additional setup after loading the view.
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if tableView == mainTableView {
            
            let cell = tableView.dequeueReusableCellWithIdentifier("maincell", forIndexPath: indexPath)
            
            
            return cell
        }
        else if tableView == subtableView1 {
            let cell = tableView.dequeueReusableCellWithIdentifier("sub1", forIndexPath: indexPath)
            
            
            return cell
        }
        else if tableView == subtableView2 {
            let cell = tableView.dequeueReusableCellWithIdentifier("sub2", forIndexPath: indexPath)
            
            
            return cell
        }
        else if tableView == subtableView3 {
            let cell = tableView.dequeueReusableCellWithIdentifier("sub3", forIndexPath: indexPath)
            
            
            return cell
        }
        else if tableView == subtableView4 {
            let cell = tableView.dequeueReusableCellWithIdentifier("sub4", forIndexPath: indexPath)
            
            
            return cell
        }
        else if tableView == subtableView5 {
            let cell = tableView.dequeueReusableCellWithIdentifier("sub5", forIndexPath: indexPath)
            
            
            return cell
        }
        
        let error = UITableViewCell()
        return error
    
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if scrollView == mainScrollView
        {
            if scrollView.contentOffset.x == 0 {
                seg.seg.setSelectedSegmentIndex(0, animated: true)
            }
            if scrollView.contentOffset.x == ScreenWidht {
                  seg.seg.setSelectedSegmentIndex(1, animated: true)
            }
            if scrollView.contentOffset.x == ScreenWidht * 2 {
                  seg.seg.setSelectedSegmentIndex(2, animated: true)
            }
            if scrollView.contentOffset.x == ScreenWidht * 3 {
                  seg.seg.setSelectedSegmentIndex(3, animated: true)
            }
            if scrollView.contentOffset.x == ScreenWidht * 4 {
                  seg.seg.setSelectedSegmentIndex(4, animated: true)
            }
            if scrollView.contentOffset.x == ScreenWidht * 5{
                  seg.seg.setSelectedSegmentIndex(5, animated: true)
            }
            
        }
    }
    func segAction(seg:HMSegmentedControl) {
        
        if seg.selectedSegmentIndex == 0{
            mainScrollView.setContentOffset(CGPointMake(0, 0), animated: true)
        }
        if seg.selectedSegmentIndex == 1{
             mainScrollView.setContentOffset(CGPointMake(ScreenWidht, 0), animated: true)
        }
        if seg.selectedSegmentIndex == 2{
            mainScrollView.setContentOffset(CGPointMake(ScreenWidht * 2, 0), animated: true)
        }
        if seg.selectedSegmentIndex == 3{
           mainScrollView.setContentOffset(CGPointMake(ScreenWidht * 3, 0), animated: true)
        }
        if seg.selectedSegmentIndex == 4{
            mainScrollView.setContentOffset(CGPointMake(ScreenWidht * 4, 0), animated: true)
        }
        if seg.selectedSegmentIndex == 5{
           mainScrollView.setContentOffset(CGPointMake(ScreenWidht * 5, 0), animated: true)
        }
        
        
    }
    
    func didLoadView() {
        
        
        self.navigationController?.navigationBar.barTintColor = NavColor
        let titleLabel = UILabel(frame: CGRectMake(10, 0, 120, 44))
        titleLabel.textColor = UIColor.whiteColor()
        titleLabel.textAlignment = NSTextAlignment.Center
        titleLabel.text = "礼物说"
        self.navigationItem.titleView = titleLabel
        
        seg = SegView(frame: CGRectMake(0, 0, ScreenWidht, 35))
        seg.seg.addTarget(self, action: Selector("segAction:"), forControlEvents: UIControlEvents.ValueChanged)
        
        self.view.addSubview(seg)
        
        
        mainScrollView = UIScrollView(frame: CGRectMake(0, 44, ScreenWidht, ScreenHight - 64 - 49))
        mainScrollView.showsHorizontalScrollIndicator = false;
        mainScrollView.pagingEnabled = true;
        mainScrollView.delegate = self
        mainScrollView.contentSize = CGSizeMake(ScreenWidht * 2 , ScreenHight - 64 - 49);
        self.view.addSubview(mainScrollView)
        
        mainTableView = UITableView(frame: CGRectMake(0, 0, ScreenWidht, ViewHeight), style: UITableViewStyle.Grouped)
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "maincell")
        mainScrollView.addSubview(mainTableView)
        
        subtableView1 = UITableView(frame:CGRectMake(ScreenWidht, 0, ScreenWidht, ViewHeight))
        subtableView2 = UITableView(frame:CGRectMake(ScreenWidht * 2, 0, ScreenWidht, ViewHeight))
        subtableView3 = UITableView(frame:CGRectMake(ScreenWidht * 3, 0, ScreenWidht, ViewHeight))
        subtableView4 = UITableView(frame:CGRectMake(ScreenWidht * 4, 0, ScreenWidht, ViewHeight))
        subtableView5 = UITableView(frame:CGRectMake(ScreenWidht * 5, 0, ScreenWidht, ViewHeight))
        subtableView1.registerClass(UITableViewCell.self, forCellReuseIdentifier: "sub1")
        subtableView2.registerClass(UITableViewCell.self, forCellReuseIdentifier: "sub2")
        subtableView3.registerClass(UITableViewCell.self, forCellReuseIdentifier: "sub3")
        subtableView4.registerClass(UITableViewCell.self, forCellReuseIdentifier: "sub4")
        subtableView5.registerClass(UITableViewCell.self, forCellReuseIdentifier: "sub5")
        subtableView1.delegate = self
        subtableView2.delegate = self
        subtableView3.delegate = self
        subtableView4.delegate = self
        subtableView5.delegate = self
        subtableView1.dataSource = self
        subtableView2.dataSource = self
        subtableView3.dataSource = self
        subtableView4.dataSource = self
        subtableView5.dataSource = self
        mainScrollView.addSubview(subtableView1)
        mainScrollView.addSubview(subtableView2)
        mainScrollView.addSubview(subtableView3)
        mainScrollView.addSubview(subtableView4)
        mainScrollView.addSubview(subtableView5)
        
        

        
        
        
        
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
