//
//  NetWorkRequestHelper.swift
//  LiWuShuoSwift
//
//  Created by 徐继垚 on 15/9/19.
//  Copyright © 2015年 徐继垚. All rights reserved.
//

import UIKit


var helper: NetWorkRequestHelper? = nil

var onesTocken: dispatch_once_t = 0

var manager : AFHTTPRequestOperationManager?

class NetWorkRequestHelper: NSObject {
    
    var httpOperation : AFHTTPRequestOperation?
    
    
    class  func shareHelper() -> NetWorkRequestHelper {
        
        dispatch_once(&onesTocken) { () -> Void in
            helper = NetWorkRequestHelper()
            
        }
        
        return helper!
        
    }
    
    
   override init(){
    
        manager = AFHTTPRequestOperationManager()
    
        manager?.responseSerializer = AFHTTPResponseSerializer()
    
        manager?.responseSerializer.acceptableContentTypes = Set(arrayLiteral:"application/json", "text/json", "text/javascript","text/html","text/plain")
    
    
        manager?.requestSerializer = AFJSONRequestSerializer()
    

        
        
        
    }
    
    
    func sendAsyncRequest(info: NetWorkRequestInfo) {
        
        if info.state == NetWorkState.get {
            
            self.httpOperation = manager?.GET(info.urlStr!, parameters: nil, success: { (operation:AFHTTPRequestOperation, result:AnyObject) -> Void in
            
                
                let jsonResult = try? NSJSONSerialization.JSONObjectWithData(operation.responseData!, options: NSJSONReadingOptions.MutableContainers)
             
               info.delegate?.requestSuccess(jsonResult!, operation: operation)
                
                
                }, failure: { (operation:AFHTTPRequestOperation, error:NSError) -> Void in
                    
                    info.delegate?.requestLose(error, operation: operation)
                    
            })
            
        }
        
        
        
        
        
    }
    func cancelRequest () {
        
        self.httpOperation?.cancel()
        
    }
    
    
    
    
    
    
    
    
    
    
    

}
