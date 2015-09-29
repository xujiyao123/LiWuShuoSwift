//
//  InterFace.swift
//  LiWuShuoSwift
//
//  Created by 徐继垚 on 15/9/14.
//  Copyright © 2015年 徐继垚. All rights reserved.
//

import UIKit
let NavColor = UIColor(red:0.97, green:0.31, blue:0.31, alpha:1)

let ScreenWidht = UIScreen.mainScreen().bounds.width
let ScreenHight = UIScreen.mainScreen().bounds.height
let ViewHeight = ScreenHight - 64 - 49


let HOME_SCROLLER_INTERFACE = "http://api.liwushuo.com/v2/banners?channel=iOS"

func HOME_CONTENT_INTERFACE(TYPE_CODE:Int) -> String {
    return "http://api.liwushuo.com/v2/channels/\(TYPE_CODE)/items?ad=1&gender=1&generation=1&limit=20&offset=0"
}
func COLLECTION_INTERFACE(TYPE:Int) ->String {
    return "http://api.liwushuo.com/v2/collections/\(TYPE)/posts?gender=1&generation=1&limit=20&offset=0"
}

//http://api.liwushuo.com/v2/promotions?gender=1&generation=1
//http://api.liwushuo.com/v2/collections/22/posts?gender=1&generation=1&limit=20&offset=0
//http://api.liwushuo.com/v2/brands/1


//http://api.liwushuo.com/v2/search/item?keyword=%E9%83%BD%E8%A7%89%E5%BE%97&limit=20&offset=0&sort=
//http://api.liwushuo.com/v2/search/post?keyword=%E9%83%BD%E8%A7%89%E5%BE%97&limit=20&offset=0&sort=
func IS_IPHONE5() ->Bool {
    if ScreenWidht == 320 {
        return true
    }else {
        return false
    }
}





class InterFace: NSObject {

    class func CreateTabBar() -> UITabBarController {
        
        
        let home = HomeViewController()
        let item = ItemViewController()
        let type = TypeViewController()
        let my = MyViewController()
      
        let nav1 = MainNavigationController(rootViewController: home)
        let nav2 = MainNavigationController(rootViewController: item)
        let nav3 = MainNavigationController(rootViewController: type)
        let nav4 = MainNavigationController(rootViewController: my)
        nav1.navigationBar.translucent = false
        nav2.navigationBar.translucent = false
        nav3.navigationBar.translucent = false
        nav4.navigationBar.translucent = false
        
        
        nav1.tabBarItem = UITabBarItem(title: "礼物说", image: UIImage(named:"tb1")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), selectedImage: UIImage(named: "tb1")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal))
        
        
        let normalAttributes = [NSForegroundColorAttributeName : UIColor(red:0.67, green:0.67, blue:0.68, alpha:1)]
        let highattributes = [NSForegroundColorAttributeName : UIColor(red:0.83, green:0.33, blue:0.31, alpha:1),]
        nav1.tabBarItem.setTitleTextAttributes(highattributes, forState: UIControlState.Selected)
        nav1.tabBarItem.setTitleTextAttributes(normalAttributes, forState: UIControlState.Normal)
       

        nav2.tabBarItem = UITabBarItem(title: "单品", image: UIImage(named:"tb2")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), selectedImage: UIImage(named: "tb2")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal))
        nav2.tabBarItem.setTitleTextAttributes(highattributes, forState: UIControlState.Selected)
        nav2.tabBarItem.setTitleTextAttributes(normalAttributes, forState: UIControlState.Normal)
        
        nav3.tabBarItem = UITabBarItem(title: "分类", image: UIImage(named:"tb3")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), selectedImage: UIImage(named: "tb3")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal))
        nav3.tabBarItem.setTitleTextAttributes(highattributes, forState: UIControlState.Selected)
        nav3.tabBarItem.setTitleTextAttributes(normalAttributes, forState: UIControlState.Normal)
        
        
        nav4.tabBarItem = UITabBarItem(title: "我", image: UIImage(named:"tb4")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), selectedImage: UIImage(named: "tb4")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal))
        nav4.tabBarItem.setTitleTextAttributes(highattributes, forState: UIControlState.Selected)
        nav4.tabBarItem.setTitleTextAttributes(normalAttributes, forState: UIControlState.Normal)
        
        
        
        
        let tab = UITabBarController()
        tab.tabBar.translucent = false
        tab.tabBar.barTintColor = UIColor(red:0.96, green:0.95, blue:0.95, alpha:1)
        tab.viewControllers = [nav1,nav2,nav3 , nav4]
        
        
        
        
        return tab;

        
        
    }
    
    
}
