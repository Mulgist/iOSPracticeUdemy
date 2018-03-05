//
//  FeedVC.swift
//  breakpoint
//
//  Created by 이주원 on 2018. 3. 4..
//  Copyright © 2018년 이주원. All rights reserved.
//

import UIKit

class FeedVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var messageArray = [Message]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DataService.instance.getAllFeedMessages { (returnedMessagesArray) in
            // 최신 Feed가 먼저 나오게 하기 위해 MessageArray에 reverse를 걸어둠
            self.messageArray = returnedMessagesArray.reversed()
            self.tableView.reloadData()
        }
    }
}

extension FeedVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell") as? FeedCell else { return UITableViewCell() }
        let image = UIImage(named: "defaultProfileImage")
        let message = messageArray[indexPath.row]
        
        DataService.instance.getUsername(uid: message.senderId) { (returnedUsername) in
            cell.configureCell(profileImage: image!, email: returnedUsername, content: message.content)
        }
        return cell
    }
}
