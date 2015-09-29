//
//  LiWuShuoModel.swift
//  LiWuShuoSwift
//
//  Created by 徐继垚 on 15/9/20.
//  Copyright © 2015年 徐继垚. All rights reserved.
//

import UIKit

private func forInWtihContentData(result:AnyObject) -> NSMutableDictionary {
    
    let dataDic = NSMutableDictionary()
    let dataArray = NSMutableArray()
    
    let array = result.objectForKey("data") as! NSDictionary
    let paging = array.objectForKey("paging") as! NSDictionary
    
    dataDic.setObject(paging.objectForKey("next_url")!, forKey: "next_url")
    
    let items = array.objectForKey("items") as! NSArray
    
    for dic in items {
        
        let model = HomeContentModel()
        model.content_url = dic.objectForKey("content_url") as? String
        if dic.objectForKey("cover_image_url") == nil {
            model.cover_image_url = dic.objectForKey("image_url") as? String
            
        }else {
        model.cover_image_url = dic.objectForKey("cover_image_url") as? String
        }
        model.likes_count = dic.objectForKey("likes_count") as? NSInteger
       
        model.title = dic.objectForKey("title") as? String
        dataArray.addObject(model)
    }
    
    dataDic.setObject(dataArray, forKey: "data")
    
    return dataDic
    
}



class HomeScrollerModel: NSObject ,NetWorkProtocol {
    
    
    var image_url : String?
    
    var target_id : Int?
    
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
            let target = dic.objectForKey("target") as? NSDictionary
            model.target_id =  target?.objectForKey("id") as? Int
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
    var likes_count: NSInteger?
    var title:String?
    var next_url:String?
    
    func contentData(type:Int) -> Void {
        let info = NetWorkRequestInfo(urlstr: HOME_CONTENT_INTERFACE(type), delegate: self)
        info.sandRequest()
    }
    func subContentData(type:Int) -> NetWorkRequestInfo {
        let info = NetWorkRequestInfo(urlstr: HOME_CONTENT_INTERFACE(type), delegate: self)
        return info
    }
    
    class func loadContentData() -> Void {
        
        let model = HomeContentModel()
        model.contentData(100)
        
    }
    func requestSuccess(result: AnyObject, operation: AFHTTPRequestOperation) {
        NSNotificationCenter.defaultCenter().postNotificationName("HOME_CONTENT_DATA", object: forInWtihContentData(result))
    }
    func requestLose(error: NSError, operation: AFHTTPRequestOperation) {
        print(error)
    }
    
    
   class func loadLiWuData(clouse:(data:NSMutableDictionary) -> Void) ->Void {
        let model = HomeContentModel()
        let info = model.subContentData(111)
        NetWorkRequestHelper.sendAsyncRequest(info) { (jsonResult, error) -> Void in
            if error == nil {
                clouse(data: forInWtihContentData(jsonResult!))
            }else {
                print(error)
            }
        }
    }
    
    class func loadMeiShiData(clouse:(data:NSMutableDictionary) -> Void) ->Void {
        let model = HomeContentModel()
        let info = model.subContentData(118)
        NetWorkRequestHelper.sendAsyncRequest(info) { (jsonResult, error) -> Void in
            if error == nil {
                clouse(data: forInWtihContentData(jsonResult!))
            }else {
                print(error)
            }
        }
    }
    
    class func loadShuMaData(clouse:(data:NSMutableDictionary) -> Void) ->Void {
        let model = HomeContentModel()
        let info = model.subContentData(121)
        NetWorkRequestHelper.sendAsyncRequest(info) { (jsonResult, error) -> Void in
            if error == nil {
                clouse(data: forInWtihContentData(jsonResult!))
            }else {
                print(error)
            }
        }
    }
    class func loadYunDongData(clouse:(data:NSMutableDictionary) -> Void) ->Void {
        let model = HomeContentModel()
        let info = model.subContentData(123)
        NetWorkRequestHelper.sendAsyncRequest(info) { (jsonResult, error) -> Void in
            if error == nil {
                clouse(data: forInWtihContentData(jsonResult!))
            }else {
                print(error)
            }
        }
    }
    class func loadYuLeData(clouse:(data:NSMutableDictionary) -> Void) ->Void {
        let model = HomeContentModel()
        let info = model.subContentData(120)
        NetWorkRequestHelper.sendAsyncRequest(info) { (jsonResult, error) -> Void in
            if error == nil {
                clouse(data: forInWtihContentData(jsonResult!))
            }else {
                print(error)
            }
        }
    }
    
    
    class func loadMoreData(url:String, clouse:(data:NSMutableDictionary) -> Void) {
        
             let info = NetWorkRequestInfo(urlstr: url, delegate:nil )
           NetWorkRequestHelper.sendAsyncRequest(info) { (jsonResult, error) -> Void in
         clouse(data: forInWtihContentData(jsonResult!))
        }
    }
    
    
    
    
    
    
}


//礼物 111
//美食 118
//数码 121
//运动 123
//娱乐 120











