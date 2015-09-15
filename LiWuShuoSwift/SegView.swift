//
//  SegView.swift
//  LiWuShuoSwift
//
//  Created by 徐继垚 on 15/9/14.
//  Copyright © 2015年 徐继垚. All rights reserved.
//

import UIKit

class SegView: UIView {

    var seg: HMSegmentedControl!
    override func awakeFromNib() {
        
        
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        seg = HMSegmentedControl(sectionTitles: ["精选","礼物","美食","数码", "运动","娱乐"])
        seg.titleTextAttributes = [NSFontAttributeName : UIFont.systemFontOfSize(15)]
        seg.autoresizingMask = UIViewAutoresizing.FlexibleRightMargin
        seg.autoresizingMask = UIViewAutoresizing.FlexibleWidth
        seg.frame = CGRectMake(0, 0, ScreenWidht, 35)
        seg.selectionStyle = HMSegmentedControlSelectionStyleTextWidthStripe;
        seg.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
        seg.selectionIndicatorColor = NavColor
        seg.selectionIndicatorHeight = 2
        seg.segmentEdgeInset = UIEdgeInsetsMake(0, 10, 0, 10);
        
       
        self.addSubview(seg)


        
        
       
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
