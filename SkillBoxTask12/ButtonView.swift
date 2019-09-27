//
//  ButtonView.swift
//  SkillBoxTask12
//
//  Created by Илья Лобков on 20/09/2019.
//  Copyright © 2019 Илья Лобков. All rights reserved.
//

import UIKit

//@IBDesignable
class ButtonView: UIView {
    
    var isSetap = false //Константа для добовления
    
    @IBInspectable var colorButton : UIColor = .blue
    @IBInspectable var colorBorderButton : UIColor = .green
    @IBInspectable var colorTextCollotButton : UIColor = .white
    @IBInspectable var buttonSizeView : CGFloat = 170
    @IBInspectable var buttonCornerRadius : CGFloat = 23
    @IBInspectable var sizeBorderButton : CGFloat = 29
    

    private let nameLable = UILabel()
    private let button = UIButton()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if isSetap {return}
        isSetap = true
        
        let w = frame.size.width
        let h = frame.size.height
        
        button.frame = CGRect(x: 0, y: 0, width: w - 3, height: h - 2)
        
        button.setTitle("Привет", for: .normal)
        button.setTitleColor(colorTextCollotButton, for: .normal)
        button.backgroundColor = colorButton
        button.frame.size.width = buttonSizeView
        button.layer.masksToBounds = true
        button.layer.cornerRadius = buttonCornerRadius
        button.layer.borderWidth = sizeBorderButton / 10
        button.layer.borderColor = colorBorderButton.cgColor
        button.addTarget(self, action: #selector(battonTap(sender:)), for: .touchUpInside)
        
        
        
        addSubview(button)
    }
    
    @objc func battonTap(sender: UIButton ){
        
        UIView.animateKeyframes(withDuration: 0.2, delay: 0, options: .autoreverse , animations: {
            self.button.alpha = 0.3
        }) { (isCompleted) in
            self.button.alpha = 1
        }
        
        print("Привет")
    }

}
