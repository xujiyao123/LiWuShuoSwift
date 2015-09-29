//
//  CollectionViewController.swift
//  LiWuShuoSwift
//
//  Created by 徐继垚 on 15/9/29.
//  Copyright © 2015年 徐继垚. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController ,UITableViewDelegate ,UITableViewDataSource{

    var tableView : UITableView!
    
    var id : Int?
    
    var dataSources = NSMutableArray()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView = UITableView(frame: CGRectMake(0, 0, ScreenWidht, ScreenHight - 64))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerClass(ContentTableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(tableView)
        
        loadData()

        // Do any additional setup after loading the view.
    }
    func loadData() {
        if id != nil {
               CollectionModel.loadCollectionData(id!)
        }
        
     
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("collectionDataCallBack:"), name: "COLLECTION_DATA", object: nil)
    }
    func collectionDataCallBack(result:NSNotification) {
        dataSources = result.object?.objectForKey("data") as! NSMutableArray
        tableView.reloadData()
        
        self.title = result.object?.objectForKey("title") as? String
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if dataSources.count != 0 {
            return dataSources.count
        }
        return 0
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
     
        let cell = NSBundle.mainBundle().loadNibNamed("ContentTableViewCell", owner: nil, options: nil).first as! ContentTableViewCell
        
        cell.drawCollectionCellWithModel(dataSources[indexPath.row] as! CollectionModel)
        return cell
        
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return IS_IPHONE5() ? 130:190
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let vc = HomeContentViewController()
        let model = dataSources[indexPath.row] as! CollectionModel
        vc.webUrl = model.content_url
            vc.cover_image = model.cover_image_url
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
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
