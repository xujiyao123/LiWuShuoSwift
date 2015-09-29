//
//  HomeViewController.swift
//  LiWuShuoSwift
//
//  Created by 徐继垚 on 15/9/14.
//  Copyright © 2015年 徐继垚. All rights reserved.
//

import UIKit




class HomeViewController: UIViewController,UITableViewDataSource ,UITableViewDelegate ,UIScrollViewDelegate ,scrollerProtocol {
    
    var seg : SegView!
    var mainScrollView :UIScrollView!
    var mainTableView : UITableView!
    var subtableView1 : UITableView!
    var subtableView2 : UITableView!
    var subtableView3 : UITableView!
    var subtableView4 : UITableView!
    var subtableView5 : UITableView!

    var scrollerDataSources = NSMutableArray()
    var mainDataSources = NSMutableArray()
    var liwuDataSources = NSMutableArray()
    var meishiDataSources = NSMutableArray()
    var shumaDataSources = NSMutableArray()
    var yundongDataSources = NSMutableArray()
    var yuleDataSources = NSMutableArray()
    
    var mainMore:String?
    var liwuMore:String?
    var meishiMore: String?
    var shumaMore: String?
    var yundongMore:String?
    var yuleMore: String?
    


    
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
        HomeContentModel.loadLiWuData { (data) -> Void in
            self.liwuDataSources = data.objectForKey("data") as! NSMutableArray
            self.liwuMore = data.objectForKey("next_url") as? String
            self.subtableView1.reloadData()
        }
        HomeContentModel.loadMeiShiData { (data) -> Void in
            self.meishiDataSources = data.objectForKey("data") as! NSMutableArray
            self.meishiMore = data.objectForKey("next_url") as? String
            self.subtableView2.reloadData()
        }
        HomeContentModel.loadShuMaData { (data) -> Void in
            self.shumaDataSources = data.objectForKey("data") as! NSMutableArray
            self.shumaMore = data.objectForKey("next_url") as? String
            self.subtableView3.reloadData()
        }
        HomeContentModel.loadYunDongData { (data) -> Void in
            self.yundongDataSources = data.objectForKey("data") as! NSMutableArray
            self.yundongMore = data.objectForKey("next_url") as? String
            self.subtableView4.reloadData()
        }
        HomeContentModel.loadYuLeData { (data) -> Void in
            self.yuleDataSources = data.objectForKey("data") as! NSMutableArray
            self.yuleMore = data.objectForKey("next_url") as? String
            self.subtableView5.reloadData()
        }

        
    }
  
    
    
    func homeScrollerDataCallBack(result:NSNotification) -> Void {
        
       
        self.scrollerDataSources = result.object as! NSMutableArray
        mainTableView.reloadData()
    }
    func homeContentDataCaLLBack(result:NSNotification) ->Void {
            self.mainDataSources = result.object?.objectForKey("data") as! NSMutableArray
        self.mainMore = result.object?.objectForKey("next_url") as? String
              mainTableView.reloadData()
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if tableView == mainTableView {
            
            if indexPath.section == 0 {
                if indexPath.row == 0 {
                   let cell = tableView.dequeueReusableCellWithIdentifier("scrollerCell", forIndexPath: indexPath) as! ScrollerTableViewCell
                    cell.drawCellWithArray(self.scrollerDataSources)
                    cell.delegate = self
                    return cell
                    
                }
            }
            if indexPath.section == 1{
                
                let cell = NSBundle.mainBundle().loadNibNamed("ContentTableViewCell", owner: nil, options: nil).first as! ContentTableViewCell
                cell.drawCellWithModel(self.mainDataSources[indexPath.row] as! HomeContentModel)
                return cell
            }
            
    
        }
       
         if tableView == subtableView1 {
            let cell = NSBundle.mainBundle().loadNibNamed("ContentTableViewCell", owner: nil, options: nil).first as! ContentTableViewCell
            cell.drawCellWithModel(self.liwuDataSources[indexPath.row] as! HomeContentModel)
            return cell
        }
         if tableView == subtableView2 {
            let cell = NSBundle.mainBundle().loadNibNamed("ContentTableViewCell", owner: nil, options: nil).first as! ContentTableViewCell
            cell.drawCellWithModel(self.meishiDataSources[indexPath.row] as! HomeContentModel)
            return cell
        }
         if tableView == subtableView3 {
            let cell = NSBundle.mainBundle().loadNibNamed("ContentTableViewCell", owner: nil, options: nil).first as! ContentTableViewCell
            cell.drawCellWithModel(self.shumaDataSources[indexPath.row] as! HomeContentModel)
                      return cell
        }
         if tableView == subtableView4 {
            let cell = NSBundle.mainBundle().loadNibNamed("ContentTableViewCell", owner: nil, options: nil).first as! ContentTableViewCell
          cell.drawCellWithModel(self.yundongDataSources[indexPath.row] as! HomeContentModel)
            
            return cell
        }
         if tableView == subtableView5 {
            let cell = NSBundle.mainBundle().loadNibNamed("ContentTableViewCell", owner: nil, options: nil).first as! ContentTableViewCell
            cell.drawCellWithModel(self.yuleDataSources[indexPath.row] as! HomeContentModel)
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
                if self.mainDataSources.count != 0 {
                return mainDataSources.count
                }
                return 0
            }
        }
        if tableView == subtableView1 {
            if liwuDataSources.count != 0 {
                return liwuDataSources.count
            }
            return 0
        }

        if tableView == subtableView2 {
            if meishiDataSources.count != 0 {
                return meishiDataSources.count
            }
            return 0
        }
        if tableView == subtableView3 {
            if shumaDataSources.count != 0 {
                return shumaDataSources.count
            }
            return 0
        }
        if tableView == subtableView4 {
            if yundongDataSources.count != 0 {
                return yundongDataSources.count
            }
            return 0
        }
        if tableView == subtableView5 {
            if yuleDataSources.count != 0 {
                return yuleDataSources.count
            }
            return 0
        }
        return 0
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
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if tableView == mainTableView {
            if indexPath.section == 1 {
            let vc = HomeContentViewController()
                vc.hidesBottomBarWhenPushed = true
            vc.webUrl = dataSourceWithArray(mainDataSources, indexpatch: indexPath).content_url
                vc.cover_image = dataSourceWithArray(mainDataSources, indexpatch: indexPath).cover_image_url
            self.navigationController?.pushViewController(vc, animated: true)
            }
        }
        if tableView == subtableView1 {
            let vc = HomeContentViewController()
            vc.webUrl = dataSourceWithArray(liwuDataSources, indexpatch: indexPath).content_url
            vc.cover_image = dataSourceWithArray(mainDataSources, indexpatch: indexPath).cover_image_url
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
        }
        if tableView == subtableView2 {
            let vc = HomeContentViewController()
            vc.webUrl = dataSourceWithArray(meishiDataSources, indexpatch: indexPath).content_url
            vc.cover_image = dataSourceWithArray(mainDataSources, indexpatch: indexPath).cover_image_url
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
        }
        if tableView == subtableView3 {
            let vc = HomeContentViewController()
            vc.webUrl = dataSourceWithArray(shumaDataSources, indexpatch: indexPath).content_url
            vc.cover_image = dataSourceWithArray(mainDataSources, indexpatch: indexPath).cover_image_url
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
        }
        if tableView == subtableView4 {
            let vc = HomeContentViewController()
            vc.webUrl = dataSourceWithArray(yundongDataSources, indexpatch: indexPath).content_url
            vc.cover_image = dataSourceWithArray(mainDataSources, indexpatch: indexPath).cover_image_url
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
        }
        if tableView == subtableView5 {
            let vc = HomeContentViewController()
            vc.webUrl = dataSourceWithArray(yuleDataSources, indexpatch: indexPath).content_url
            vc.cover_image = dataSourceWithArray(mainDataSources, indexpatch: indexPath).cover_image_url
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func scrollerButtonIsTouch(button: UIButton?) {
        let vc = CollectionViewController()
        if button!.tag != 0 {
            vc.id = (button?.tag)! - 100
        }
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
        
    }

    
    func dataSourceWithArray(array:NSMutableArray , indexpatch:NSIndexPath) -> HomeContentModel{
        
        let model = array[indexpatch.row] as! HomeContentModel
        return model
    }
    func mainLoadMoreData() {
        if self.mainMore == nil {
            return
        }else {
        HomeContentModel.loadMoreData(self.mainMore!) { (data) -> Void in
            self.mainDataSources.addObjectsFromArray(data.objectForKey("data") as! [HomeContentModel])
            self.mainMore = data.objectForKey("next_url") as? String
            self.mainTableView.reloadData()
            self.mainTableView.footer.endRefreshing()
            }
        }
    }
    func liwuLoadMoreData() {
        if liwuMore == nil {
            return
        }else
        {
        HomeContentModel.loadMoreData(self.liwuMore!) { (data) -> Void in
            self.liwuDataSources.addObjectsFromArray(data.objectForKey("data") as! [HomeContentModel])
            self.liwuMore = data.objectForKey("next_url") as? String
            self.subtableView1.reloadData()
            self.subtableView1.footer.endRefreshing()
            }
            }
    }
    func meishiLoadMoreData() {
        if meishiMore == nil {
            return
        }else {
        HomeContentModel.loadMoreData(self.meishiMore!) { (data) -> Void in
            self.meishiDataSources.addObjectsFromArray(data.objectForKey("data") as! [HomeContentModel])
            self.meishiMore = data.objectForKey("next_url") as? String
            self.subtableView2.reloadData()
            self.subtableView2.footer.endRefreshing()
        }
        }
    }
    func shumaLoadMoreData() {
        if shumaMore == nil {
            return
        }else {
        HomeContentModel.loadMoreData(self.shumaMore!) { (data) -> Void in
            self.shumaDataSources.addObjectsFromArray(data.objectForKey("data") as! [HomeContentModel])
            self.shumaMore = data.objectForKey("next_url") as? String
            self.subtableView3.reloadData()
            self.subtableView3.footer.endRefreshing()
        }
        }
    }
    func yundongLoadMoreData() {
        if yundongMore == nil {
            return
        }else {
        HomeContentModel.loadMoreData(self.yundongMore!) { (data) -> Void in
            self.yundongDataSources.addObjectsFromArray(data.objectForKey("data") as! [HomeContentModel])
            self.yundongMore = data.objectForKey("next_url") as? String
            self.subtableView4.reloadData()
            self.subtableView4.footer.endRefreshing()
        }
        }
    }
    func yuleLoadMoreData() {
        if yuleMore == nil {
            return
        }else {
        HomeContentModel.loadMoreData(self.yuleMore!) { (data) -> Void in
            self.yuleDataSources.addObjectsFromArray(data.objectForKey("data") as! [HomeContentModel])
            self.yuleMore = data.objectForKey("next_url") as? String
            self.subtableView5.reloadData()
            self.subtableView5.footer.endRefreshing()
        }
        }
    }
    //礼物 111
    //美食 118
    //数码 121
    //运动 123
    //娱乐 120
    
    
    func didLoadView() {
        
        
        self.navigationController?.navigationBar.barTintColor = NavColor
        
        self.title = "礼物说"

        
        seg = SegView(frame: CGRectMake(0, 0, ScreenWidht, 35))
        seg.seg.addTarget(self, action: Selector("segAction:"), forControlEvents: UIControlEvents.ValueChanged)
        
        self.view.addSubview(seg)
        
        
        mainScrollView = UIScrollView(frame: CGRectMake(0, 35, ScreenWidht, ScreenHight - 64 - 49 - 35))
        mainScrollView.showsHorizontalScrollIndicator = false;
        mainScrollView.pagingEnabled = true;
        mainScrollView.delegate = self
        mainScrollView.contentSize = CGSizeMake(ScreenWidht * 6 , ScreenHight - 64 - 49 - 35);
        self.view.addSubview(mainScrollView)
        
        mainTableView = UITableView(frame: CGRectMake(0, 0, ScreenWidht, ViewHeight - 35), style: UITableViewStyle.Grouped)
        mainTableView.delegate = self
        mainTableView.dataSource = self
        
     
  
        mainTableView.header = MJChiBaoZiHeader(refreshingTarget: self, refreshingAction: Selector("qwe"))
        
        mainTableView.separatorStyle = UITableViewCellSeparatorStyle.None
        mainTableView.footer = MJRefreshBackNormalFooter(refreshingTarget: self, refreshingAction: Selector("mainLoadMoreData"))
        mainTableView.registerClass(ContentTableViewCell.self, forCellReuseIdentifier: "maincell")
        mainTableView.registerClass(ScrollerTableViewCell.self, forCellReuseIdentifier: "scrollerCell")
             mainScrollView.addSubview(mainTableView)
        
        subtableView1 = UITableView(frame:CGRectMake(ScreenWidht, 0, ScreenWidht, ViewHeight - 35))
        subtableView2 = UITableView(frame:CGRectMake(ScreenWidht * 2, 0, ScreenWidht, ViewHeight - 35))
        subtableView3 = UITableView(frame:CGRectMake(ScreenWidht * 3, 0, ScreenWidht, ViewHeight - 35))
        subtableView4 = UITableView(frame:CGRectMake(ScreenWidht * 4, 0, ScreenWidht, ViewHeight - 35))
        subtableView5 = UITableView(frame:CGRectMake(ScreenWidht * 5, 0, ScreenWidht, ViewHeight - 35))
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
        subtableView1.footer = MJRefreshBackNormalFooter(refreshingTarget: self, refreshingAction: Selector("liwuLoadMoreData"))
         subtableView2.footer = MJRefreshBackNormalFooter(refreshingTarget: self, refreshingAction: Selector("meishiLoadMoreData"))
         subtableView3.footer = MJRefreshBackNormalFooter(refreshingTarget: self, refreshingAction: Selector("shumaLoadMoreData"))
//         subtableView4.footer = MJRefreshBackNormalFooter(refreshingTarget: self, refreshingAction: Selector("yundongLoadMoreData"))
//         subtableView5.footer = MJRefreshBackNormalFooter(refreshingTarget: self, refreshingAction: Selector("yuleLoadMoreData"))
        subtableView1.header = MJChiBaoZiHeader(refreshingTarget: self, refreshingAction: Selector("qwe"))
        subtableView2.header = MJChiBaoZiHeader(refreshingTarget: self, refreshingAction: Selector("qwe"))
        subtableView3.header = MJChiBaoZiHeader(refreshingTarget: self, refreshingAction: Selector("qwe"))
        subtableView4.header = MJChiBaoZiHeader(refreshingTarget: self, refreshingAction: Selector("qwe"))
        subtableView5.header = MJChiBaoZiHeader(refreshingTarget: self, refreshingAction: Selector("qwe"))
        subtableView1.separatorStyle = UITableViewCellSeparatorStyle.None
        subtableView2.separatorStyle = UITableViewCellSeparatorStyle.None
        subtableView3.separatorStyle = UITableViewCellSeparatorStyle.None
        subtableView4.separatorStyle = UITableViewCellSeparatorStyle.None
        subtableView5.separatorStyle = UITableViewCellSeparatorStyle.None
        mainScrollView.addSubview(subtableView1)
        mainScrollView.addSubview(subtableView2)
        mainScrollView.addSubview(subtableView3)
        mainScrollView.addSubview(subtableView4)
        mainScrollView.addSubview(subtableView5)
        
        

        
        
        
        
    }
    func qwe() {
        NSThread.sleepForTimeInterval(2)
        self.mainTableView.header.endRefreshing()
        self.subtableView1.header.endRefreshing()
        self.subtableView2.header.endRefreshing()
        self.subtableView3.header.endRefreshing()
        self.subtableView4.header.endRefreshing()
        self.subtableView5.header.endRefreshing()
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
