//
//  TabbarController.swift
//  TabBarDemo
//
//  Created by hanqing on 2/27/15.
//  Copyright (c) 2015 hanqing. All rights reserved.
//

import UIKit



class TabbarController: UITabBarController, TabBarClickNotification {
    
    //获取屏幕 宽度、高度
    let SCREEN_WIDTH: Int   = Int(UIScreen.mainScreen().bounds.size.width)
    let SCREEN_HEIGHT: Int  = Int(UIScreen.mainScreen().bounds.size.height)
    
    var tabBarView: TabBarView!
    var previousBtn: CustomButton! //记录前一次选中的按钮


    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBar.hidden = true
        var tabBarViewY = SCREEN_HEIGHT - 45
        
        tabBarView = TabBarView(frame: CGRect(x: 0, y: tabBarViewY, width: SCREEN_WIDTH, height: 45))
        self.view.addSubview(tabBarView)
        
        tabBarView.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func notifyButtonChange(button: CustomButton) {
        self.selectedIndex = button.tag
        
        button.setNotification(1)
        button.enabled = false
        
        if (previousBtn != nil) && (previousBtn != button) {
            previousBtn.clearNotification()
            previousBtn.enabled = true
        }
        
        previousBtn = button
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
