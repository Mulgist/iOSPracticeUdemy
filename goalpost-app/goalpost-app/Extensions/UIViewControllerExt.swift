//
//  UIViewControllerExt.swift
//  goalpost-app
//
//  Created by 이주원 on 2018. 2. 27..
//  Copyright © 2018년 이주원. All rights reserved.
//

import UIKit

extension UIViewController {
    // 화면 등장할 때 애니메이션 동작
    func presentDetail(viewControllerToPresent: UIViewController) {
        // CA는 Core Animation을 뜻한다.
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionPush
        // 오른쪽에서 push
        transition.subtype = kCATransitionFromRight
        self.view.window?.layer.add(transition, forKey: kCATransition)
        
        // animated를 false로 해두지 않으면 기본 애니메이션으로 동작하게 된다.
        present(viewControllerToPresent, animated: false, completion: nil)
    }
    
    // 화면 닫을 때 애니메이션 동작
    func dismissDetail() {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionPush
        // 왼쪽에서 push
        transition.subtype = kCATransitionFromLeft
        self.view.window?.layer.add(transition, forKey: kCATransition)
        
        // animated를 false로 해두지 않으면 기본 애니메이션으로 동작하게 된다.
        dismiss(animated: false, completion: nil)
    }
}
