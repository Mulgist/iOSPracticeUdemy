//
//  ChannelCell.swift
//  Smack
//
//  Created by 이주원 on 2018. 2. 18..
//  Copyright © 2018년 이주원. All rights reserved.
//

import UIKit

class ChannelCell: UITableViewCell {
    // Outlets
    @IBOutlet weak var channelName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            self.layer.backgroundColor = UIColor(white: 1, alpha: 0).cgColor
        } else {
            self.layer.backgroundColor = UIColor.clear.cgColor
        }
    }
    
    func configureCell(channel: Channel) {
        let title = channel.name ?? ""
        channelName.text = "#\(title)"
        channelName.font = UIFont(name: "Avenir-Medium", size: 17)
        
        for id in MessageService.instance.unreadChannels {
            if id == channel._id {
                channelName.font = UIFont(name: "Avenir-Heavy", size: 20)
            }
        }
    }
}
