//
//  ScrollerTableViewCell.swift
//  LiWuShuoSwift
//
//  Created by 徐继垚 on 15/9/29.
//  Copyright © 2015年 徐继垚. All rights reserved.
//

import UIKit

protocol scrollerProtocol : NSObjectProtocol {
    
    func scrollerButtonIsTouch(button:UIButton?)
    
    
}

class ScrollerTableViewCell: UITableViewCell , UIScrollViewDelegate {
    
    var scrollView :UIScrollView!
    
    var page : UIPageControl!
    
    var cimage: UIImageView!
    
    var index: Int!
    
    var modelCount : Int!
    
    var delegate: scrollerProtocol?

    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
     
    
        scrollView = UIScrollView(frame: CGRectMake(0, 0, ScreenWidht, scrollerHeight()))
        self.scrollView.showsHorizontalScrollIndicator = false
        self.scrollView.pagingEnabled = true;
        self.addSubview(scrollView)
        
        NSTimer.scheduledTimerWithTimeInterval(5, target: self, selector: Selector("runTimePage"), userInfo: nil, repeats: true)

        page = UIPageControl(frame: CGRectMake(-10, scrollerHeight() - 20, ScreenWidht, 10))
        page.currentPageIndicatorTintColor = UIColor.redColor()
       self.addSubview(page)
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func drawCellWithArray(array:NSMutableArray) {
    
        modelCount = array.count
    page.numberOfPages = array.count
        
        let count = CGFloat(array.count)
    scrollView.contentSize = CGSizeMake(ScreenWidht * count, 0)
      
        
        for(var i = 0 ; i < array.count ; i++) {
            cimage = UIImageView(frame: CGRectMake(ScreenWidht * CGFloat(i), 0, ScreenWidht, scrollerHeight()))
            cimage.userInteractionEnabled = true
            
            let model = array[i] as! HomeScrollerModel
            
            cimage.sd_setImageWithURL(NSURL(string: model.image_url!))
            
            scrollView.addSubview(cimage)
            
            let button = UIButton(frame: CGRectMake(ScreenWidht * CGFloat(i), 0, ScreenWidht, scrollerHeight()))
           if  model.type == "collection" {
            
          
              button.tag = model.target_id! + 100
            
            }
            button.addTarget(self, action: Selector("buttonAction:"), forControlEvents: UIControlEvents.TouchUpInside)
            index = i
            scrollView.addSubview(button)
            
        }

    }
    func pageAction() {
        scrollView.setContentOffset(CGPointMake(CGFloat(page.currentPage) * ScreenWidht, 0), animated: true)
    }
    func turnPage() {
        let apage = page.currentPage
        scrollView.scrollRectToVisible(CGRectMake(ScreenWidht * CGFloat(apage), 0, ScreenWidht, 160), animated: false)
        page.addTarget(self, action: Selector("runTimePage"), forControlEvents: UIControlEvents.ValueChanged)
    }
    
    func runTimePage() {
        var apage = page.currentPage
        apage++
        apage = apage > modelCount - 1 ? 0 : apage
        page.currentPage = apage
        scrollView.setContentOffset(CGPointMake(CGFloat(page.currentPage) * ScreenWidht, 0), animated: true)
        turnPage()
    }
    func buttonAction(sender:UIButton?) {
     delegate?.scrollerButtonIsTouch(sender)
    }


    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func scrollerHeight() -> CGFloat {
        if ScreenWidht == 320 {
            return 150
        }else {
            return 190
        }
    }

}




  