//
//  tabBarView.swift
//  TabBarDemo
//
//  Created by hanqing on 2/28/15.
//  Copyright (c) 2015 hanqing. All rights reserved.
//

import UIKit

protocol TabBarClickNotification {
    func notifyButtonChange(button: CustomButton)
}


class TabBarView: UIView {
    
    var button1: UIButton!
    var button2: UIButton!
    var button3: UIButton!
    var button4: UIButton!
    
    var delegate : TabBarClickNotification?
    

     override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = frame
        self.backgroundColor = UIColor.whiteColor()
        self.userInteractionEnabled = true
        
        button1 = self.creatButtonWithNormalName("timelineIcon", andSelectName: "timelineIconHighlighted", andIndex: 0)
        self.addSubview(button1)
        button2 = self.creatButtonWithNormalName("mentionsIcon", andSelectName: "mentionsIconHighlighted", andIndex: 1)
        self.addSubview(button2)
        button3 = self.creatButtonWithNormalName("messagesIcon", andSelectName: "messagesIconHighlighted", andIndex: 2)
        self.addSubview(button3)
        button4 = self.creatButtonWithNormalName("searchIcon", andSelectName: "searchIconHighlighted", andIndex: 3)
        self.addSubview(button4)
        
        addConstraintsToView()

        self.subviews[0]
        
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func creatButtonWithNormalName(normal: String, andSelectName selected: String, andIndex index: Int ) -> CustomButton{
        
        var button: CustomButton = CustomButton.buttonWithType(UIButtonType.Custom) as CustomButton
        button.tag = index
        
        button.setImage(UIImage(named: normal), forState: UIControlState.Normal)
        button.setImage(UIImage(named: selected), forState: UIControlState.Disabled)
        button.setBackgroundImage(UIImage(named: "tabButtonBackground"), forState: UIControlState.Normal)
        button.setBackgroundImage(UIImage(named: "hightabButtonBackground"), forState: UIControlState.Selected)
        
        button.addTarget(self, action: "changeViewController:", forControlEvents: UIControlEvents.TouchDown)
        
        button.imageView?.contentMode    = UIViewContentMode.Center
        button.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        return button
    }
    
    func addConstraintsToView(){
//        var buttons:NSDictionary = ["button1": button1, "button2": button2, "button3": button3, "button4": button4 ]
//        var constraintsArray = NSMutableArray()
//        constraintsArray.addObjectsFromArray(NSLayoutConstraint.constraintsWithVisualFormat("H:|-[button1(45)]-10-[button2(45)]-10-[button3(45)]-10-[button4(45)]-|", options: nil, metrics:nil, views:buttons ))
//        
//        constraintsArray.addObjectsFromArray(NSLayoutConstraint.constraintsWithVisualFormat("V:[button1(45)]-[button2(45)]-[button3(45)]-[button4(45)]-|", options: nil, metrics: nil, views:buttons))
//        
//        self.addConstraints(constraintsArray)
        
        
        let viewsDictionary = ["button1": button1, "button2": button2, "button3": button3, "button4": button4 ]
        
        var button1_constraint_H_Format  =  "|[button1]"
        var button1_constraint_V_Format  =  "V:[button1(45)]|"
        var button2_constraint_H_Format  =  "[button1]-0-[button2(==button1)]"
        var button2_constraint_V_Format  =  "V:[button2(45)]|"
        var button3_constraint_H_Format  =  "[button2]-0-[button3(==button2)]"
        var button3_constraint_V_Format  =  "V:[button3(45)]|"
        var button4_constraint_H_Format  =  "[button3]-0-[button4(==button3)]|"
        var button4_constraint_V_Format  =  "V:[button4(45)]|"
        
        let button1_constraint_H:NSArray = NSLayoutConstraint.constraintsWithVisualFormat(button1_constraint_H_Format, options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
        let button1_constraint_V:NSArray = NSLayoutConstraint.constraintsWithVisualFormat(button1_constraint_V_Format, options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
        let button2_constraint_H:NSArray = NSLayoutConstraint.constraintsWithVisualFormat(button2_constraint_H_Format, options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
        let button2_constraint_V:NSArray = NSLayoutConstraint.constraintsWithVisualFormat(button2_constraint_V_Format, options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
        let button3_constraint_H:NSArray = NSLayoutConstraint.constraintsWithVisualFormat(button3_constraint_H_Format, options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
        let button3_constraint_V:NSArray = NSLayoutConstraint.constraintsWithVisualFormat(button3_constraint_V_Format, options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
        let button4_constraint_H:NSArray = NSLayoutConstraint.constraintsWithVisualFormat(button4_constraint_H_Format, options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
        let button4_constraint_V:NSArray = NSLayoutConstraint.constraintsWithVisualFormat(button4_constraint_V_Format, options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
        
        self.addConstraints(button1_constraint_H)
        self.addConstraints(button1_constraint_V)
        self.addConstraints(button2_constraint_H)
        self.addConstraints(button2_constraint_V)
        self.addConstraints(button3_constraint_H)
        self.addConstraints(button3_constraint_V)
        self.addConstraints(button4_constraint_H)
        self.addConstraints(button4_constraint_V)
        
    }

    func changeViewController(sender: CustomButton){
        self.delegate?.notifyButtonChange(sender)
    }


}
