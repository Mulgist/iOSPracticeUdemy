//
//  AppDelegate.swift
//  Smack
//
//  Created by 이주원 on 2018. 2. 5..
//  Copyright © 2018년 이주원. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    // 83강(Socket)시 수정함
    func applicationDidBecomeActive(_ application: UIApplication) {
        // 응용 프로그램이 비활성 상태 일 때 일시 중지되었거나 아직 시작되지 않은 모든 작업을 다시 시작하십시오. 응용 프로그램이 백그라운드에서 이전에 있었던 경우 선택적으로 사용자 인터페이스를 새로 고칩니다.
        SocketService.instance.establishConnection()
    }

    // 83강(Socket)시 수정함
    func applicationWillTerminate(_ application: UIApplication) {
        // 응용 프로그램이 곧 종료 될 때 호출됩니다. 적절한 경우 데이터를 저장하십시오. applicationDidEnterBackground를 참조하십시오.
        SocketService.instance.closeConnection()
    }


}

