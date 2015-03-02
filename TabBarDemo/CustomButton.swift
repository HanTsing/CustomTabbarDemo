//
//  CustomButton.swift
//  TabBarDemo
//
//  Created by hanqing on 2/27/15.
//  Copyright (c) 2015 hanqing. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    
    var notificationImageView: UIImageView!
    var countLabel: UILabel!
    let notificationImageViewTag = 18
    
    
    func setNotification(count: Int){
        updateImageView(count)
    }
    
    func clearNotification(){
       var notificationImageView =  self.viewWithTag(notificationImageViewTag) as UIImageView
       notificationImageView.removeFromSuperview()
    }
    
    func updateImageView(count: Int){
        var image = UIImage(named: "tabBarNotificationLightOn")
        self.notificationImageView = UIImageView(image: image)
        self.notificationImageView.tag = notificationImageViewTag
        self.notificationImageView.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        self.countLabel = UILabel()
        countLabel.text = String(count)
        countLabel.font = UIFont.systemFontOfSize(10)
        self.countLabel.textColor = UIColor.whiteColor()
        self.countLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        self.notificationImageView.addSubview(countLabel)
        self.addSubview(notificationImageView)
        addConstraintsToView()
    }
    
    func addConstraintsToView(){
        let viewsDictionary = ["image": notificationImageView, "label": countLabel]
        
        var image_constraint_H_Format  =  "|-(>=5)-[image(25)]-2-|"
        var image_constraint_V_Format  =  "V:|-1-[image(25)]"
        var label_constraint_H_Format  =  "|-(>=5)-[label]-9-|"
        var label_constraint_V_Fromat  =  "V:[label]-8-|"
        
        
        let image_constraint_H:NSArray = NSLayoutConstraint.constraintsWithVisualFormat(image_constraint_H_Format, options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
        let image_constraint_V:NSArray = NSLayoutConstraint.constraintsWithVisualFormat(image_constraint_V_Format, options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
        let label_constraint_H:NSArray = NSLayoutConstraint.constraintsWithVisualFormat(label_constraint_H_Format, options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
        let label_constraint_V:NSArray = NSLayoutConstraint.constraintsWithVisualFormat(label_constraint_V_Fromat, options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
        
        self.addConstraints(image_constraint_H)
        self.addConstraints(image_constraint_V)
        self.addConstraints(label_constraint_H)
        self.addConstraints(label_constraint_V)
    }
    
}
