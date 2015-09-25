//
//  HomeViewController.swift
//  LiWuShuoSwift
//
//  Created by 徐继垚 on 15/9/14.
//  Copyright © 2015年 徐继垚. All rights reserved.
//

import UIKit




class HomeViewController: UIViewController,UITableViewDataSource ,UITableViewDelegate ,UIScrollViewDelegate  {
    
    var seg : SegView!
    var mainScrollView :UIScrollView!
    var mainTableView : UITableView!
    var subtableView1 : UITableView!
    var subtableView2 : UITableView!
    var subtableView3 : UITableView!
    var subtableView4 : UITableView!
    var subtableView5 : UITableView!

    var scrollerDataSources = NSMutableArray()
    var mainDataSources = NSMutableDictionary()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
          
        self.didLoadView()
        
        self.loadData()
        
        // Do any additional setup after loading the view.
    }
    func loadData() {
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("homeScrollerDataCallBack:"), name: "HOME_SCROLLER_DATA", object: nil )
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("homeContentDataCaLLBack:"), name: "HOME_CONTENT_DATA", object: nil)
        
         HomeScrollerModel.loadscrollerData()
        
        HomeContentModel.loadContentData()
        HomeContentModel.loadPData()
        HomeContentModel.loadPOData()
        HomeContentModel.loadFdata()
        HomeContentModel.loadSData()
        HomeContentModel.loadYData()
        
    }
    func typeForKey(type: Int ) -> NSMutableArray {
        
        let data = self.mainDataSources.objectForKey("http://api.liwushuo.com/v2/channels/\(type)/items?generation=1&gender=1&limit=20&ad=1&offset=20")
     
        return data?.objectForKey("data") as! NSMutableArray
  
    }
    
    
    func homeScrollerDataCallBack(result:NSNotification) -> Void {
        
       
        self.scrollerDataSources = result.object as! NSMutableArray
        mainTableView.reloadData()
    }
    func homeContentDataCaLLBack(result:NSNotification) ->Void {
        let data = result.object as! NSDictionary
        
        if mainDataSources.objectForKey(result.object?.objectForKey("next_url") as! String) == nil {
            
            self.mainDataSources.setObject(data , forKey:result.object?.objectForKey("next_url") as! String)
            
        }
              mainTableView.reloadData()
        
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if tableView == mainTableView {
            
            if indexPath.section == 0 {
                if indexPath.row == 0 {
                   let cell = tableView.dequeueReusableCellWithIdentifier("scrollerCell", forIndexPath: indexPath) as! ScrollewTableViewCell
                    cell.drawCellWitharray(self.scrollerDataSources)
                    
                    return cell
                    
                }
            }
            if indexPath.section == 1{
                
                let cell = NSBundle.mainBundle().loadNibNamed("ContentTableViewCell", owner: nil, options: nil).first as! ContentTableViewCell
                cell.drawCellWithModel(typeForKey(100)[indexPath.row] as! HomeContentModel)
                return cell
            }
            
    
        }
        print(tableView)
         if tableView == subtableView1 {
            var cell = NSBundle.mainBundle().loadNibNamed("ContentTableViewCell", owner: nil, options: nil).first as! ContentTableViewCell
          cell = tableView.dequeueReusableCellWithIdentifier("sub1", forIndexPath: indexPath) as! ContentTableViewCell
            cell.drawCellWithModel(typeForKey(111)[indexPath.row] as! HomeContentModel)
            
            return cell
        }
         if tableView == subtableView2 {
            let cell = NSBundle.mainBundle().loadNibNamed("ContentTableViewCell", owner: nil, options: nil).first as! ContentTableViewCell
            cell.drawCellWithModel(typeForKey(118)[indexPath.row] as! HomeContentModel)
            
            return cell
        }
         if tableView == subtableView3 {
            let cell = NSBundle.mainBundle().loadNibNamed("ContentTableViewCell", owner: nil, options: nil).first as! ContentTableViewCell
            
            cell.drawCellWithModel(typeForKey(121)[indexPath.row] as! HomeContentModel)
            return cell
        }
         if tableView == subtableView4 {
            let cell = NSBundle.mainBundle().loadNibNamed("ContentTableViewCell", owner: nil, options: nil).first as! ContentTableViewCell
            cell.drawCellWithModel(typeForKey(123)[indexPath.row] as! HomeContentModel)
            
            return cell
        }
         if tableView == subtableView5 {
            let cell = NSBundle.mainBundle().loadNibNamed("ContentTableViewCell", owner: nil, options: nil).first as! ContentTableViewCell
            cell.drawCellWithModel(typeForKey(120)[indexPath.row] as! HomeContentModel)
            return cell
        }
        
        let error = UITableViewCell()
        return error
    
    }
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if tableView == mainTableView {
            if indexPath.section == 0 {
                if indexPath.row == 0 {
                    
                    return IS_IPHONE5() ? 150:190
                }
                return 60
            }else {
             return  IS_IPHONE5() ? 130:190
                
            }
        }else {
            return IS_IPHONE5() ? 130:190
        }
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        if tableView == mainTableView {
                     return 2
            
        }
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       
        if tableView == mainTableView {
            if section == 0 {
                if self.scrollerDataSources.count != 0 {

                return 2
                }
            }else {
                return typeForKey(100).count == 0 ? 0 : typeForKey(100).count
                
            }
            
        }
        return self.mainDataSources.count == 6 ? 20 : 0
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
        
        
        mainScrollView = UIScrollView(frame: CGRectMake(0, 35, ScreenWidht, ScreenHight - 64 - 49))
        mainScrollView.showsHorizontalScrollIndicator = false;
        mainScrollView.pagingEnabled = true;
        mainScrollView.delegate = self
        mainScrollView.contentSize = CGSizeMake(ScreenWidht * 6 , ScreenHight - 64 - 49);
        self.view.addSubview(mainScrollView)
        
        mainTableView = UITableView(frame: CGRectMake(0, 0, ScreenWidht, ViewHeight), style: UITableViewStyle.Grouped)
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.registerClass(ContentTableViewCell.self, forCellReuseIdentifier: "maincell")
        mainTableView.registerClass(ScrollewTableViewCell.self, forCellReuseIdentifier: "scrollerCell")
             mainScrollView.addSubview(mainTableView)
        
        subtableView1 = UITableView(frame:CGRectMake(ScreenWidht, 0, ScreenWidht, ViewHeight))
        subtableView2 = UITableView(frame:CGRectMake(ScreenWidht * 2, 0, ScreenWidht, ViewHeight))
        subtableView3 = UITableView(frame:CGRectMake(ScreenWidht * 3, 0, ScreenWidht, ViewHeight))
        subtableView4 = UITableView(frame:CGRectMake(ScreenWidht * 4, 0, ScreenWidht, ViewHeight))
        subtableView5 = UITableView(frame:CGRectMake(ScreenWidht * 5, 0, ScreenWidht, ViewHeight))
        subtableView1.registerClass(ContentTableViewCell.self, forCellReuseIdentifier: "sub1")
        subtableView2.registerClass(ContentTableViewCell.self, forCellReuseIdentifier: "sub2")
        subtableView3.registerClass(ContentTableViewCell.self, forCellReuseIdentifier: "sub3")
        subtableView4.registerClass(ContentTableViewCell.self, forCellReuseIdentifier: "sub4")
        subtableView5.registerClass(ContentTableViewCell.self, forCellReuseIdentifier: "sub5")
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
