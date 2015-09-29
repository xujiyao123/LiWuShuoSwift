//
//  ContentTableViewCell.swift
//  LiWuShuoSwift
//
//  Created by 徐继垚 on 15/9/25.
//  Copyright © 2015年 徐继垚. All rights reserved.
//

import UIKit

class ContentTableViewCell: UITableViewCell {

    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var backLabel: UILabel!
    @IBOutlet weak var contentImageView: UIImageView!
    
    @IBOutlet weak var contentLabel: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectionStyle = UITableViewCellSelectionStyle.None
        
        
        self.backLabel.layer.masksToBounds = true
        self.backLabel.layer.cornerRadius = 15
      // self.contentImageView.backgroundColor = UIColor.redColor()
        self.contentImageView.layer.masksToBounds = true
        self.contentImageView.layer.cornerRadius = 5
        self.contentImageView.contentMode = UIViewContentMode.ScaleAspectFill
        self.contentImageView.clipsToBounds = true
        
        
        // Initialization code
    }
    
    func drawCellWithModel(model:HomeContentModel) {
        
        
        if model.cover_image_url != nil {
        self.contentImageView.sd_setImageWithURL(NSURL(string: model.cover_image_url!))
        }
        self.contentLabel.text = model.title
       // print(model.likes_count)
        if model.likes_count != nil {
            
            self.likeLabel.text = String(format: "%lu", model.likes_count!)
        }
        
        
    }
    func drawCollectionCellWithModel(model:CollectionModel) {
        if model.cover_image_url != nil {
            self.contentImageView.sd_setImageWithURL(NSURL(string: model.cover_image_url!))
        }
        self.contentLabel.text = model.title
        // print(model.likes_count)
        if model.likes_count != nil {
            
            self.likeLabel.text = String(format: "%lu", model.likes_count!)
        }
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
