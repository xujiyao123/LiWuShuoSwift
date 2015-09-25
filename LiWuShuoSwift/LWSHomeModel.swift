//
//  LiWuShuoModel.swift
//  LiWuShuoSwift
//
//  Created by 徐继垚 on 15/9/20.
//  Copyright © 2015年 徐继垚. All rights reserved.
//

import UIKit




class HomeScrollerModel: NSObject ,NetWorkProtocol {
    
    
    var image_url : String?
    
    var target_id : String?
    
    var type : String?
    
    var target_url: String?
    
    
    func loadHomeScrollerData() {
        let info = NetWorkRequestInfo(urlstr: HOME_SCROLLER_INTERFACE, delegate: self)
        info.sandRequest()
    }
    
    class func loadscrollerData() {
        let model = HomeScrollerModel()
        model.loadHomeScrollerData()
            
    }
    
    func requestSuccess(result: AnyObject, operation: AFHTTPRequestOperation) {
        
        let dataArray = NSMutableArray()
        
        let array = result.objectForKey("data") as! NSDictionary
        let banners = array.objectForKey("banners") as! NSArray
        
        for dic in banners {
            
            let model = HomeScrollerModel()
            model.image_url = dic.objectForKey("image_url") as? String
            model.target_id = dic.objectForKey("target_id") as? String
            model.type = dic.objectForKey("type") as? String
            model.target_url = dic.objectForKey("target_url") as? String
            
            dataArray.addObject(model)
        }
        
        NSNotificationCenter.defaultCenter().postNotificationName("HOME_SCROLLER_DATA", object: dataArray)
        
    }
    func requestLose(error: NSError, operation: AFHTTPRequestOperation) {
        print(error)
    }
    
    

}

class HomeContentModel: NSObject  ,NetWorkProtocol{
    
    
    var content_url: String?
    
    var cover_image_url: String?
    
    var likes_count: String?
    
    var title:String?
    
    var next_url:String?
    
    
    func contentData(type:Int) -> Void {
        
        
        
        let info = NetWorkRequestInfo(urlstr: HOME_CONTENT_INTERFACE(type), delegate: self)
        info.sandRequest()
    
    }
    
    class func loadContentData() -> Void {
        
        let model = HomeContentModel()
        model.contentData(100)
        
    }
    //礼物 111
    //美食 118
    //数码 121
    //运动 123
    //娱乐 120
    class func loadPData() {
        let model = HomeContentModel()
        model.contentData(111)
    }
    class func loadFdata() {
        let model = HomeContentModel()
        model.contentData(118)
    }
    class func loadSData() {
        let model = HomeContentModel()
        model.contentData(121)
    }
    class func loadPOData() {
        let model = HomeContentModel()
        model.contentData(123)
    }
    class func loadYData() {
        let model = HomeContentModel()
        model.contentData(120)
    }

    
    
    func requestSuccess(result: AnyObject, operation: AFHTTPRequestOperation) {
        let dataDic = NSMutableDictionary()
        let dataArray = NSMutableArray()
        
        let array = result.objectForKey("data") as! NSDictionary
        let paging = array.objectForKey("paging") as! NSDictionary
        
        dataDic.setObject(paging.objectForKey("next_url")!, forKey: "next_url")
        
        let items = array.objectForKey("items") as! NSArray
        
        for dic in items {
            
            let model = HomeContentModel()
            model.content_url = dic.objectForKey("content_url") as? String
            model.cover_image_url = dic.objectForKey("cover_image_url") as? String
            model.likes_count = dic.objectForKey("likes_count") as? String
            model.title = dic.objectForKey("title") as? String
            dataArray.addObject(model)
        }
        
        dataDic.setObject(dataArray, forKey: "data")
        
        NSNotificationCenter.defaultCenter().postNotificationName("HOME_CONTENT_DATA", object: dataDic)
        
        
        
        
        
    }
    func requestLose(error: NSError, operation: AFHTTPRequestOperation) {
        print(error)
    }
    
    
    
    
    
}














