//
//  CustomSearchBar.swift
//  CustomSearchBar
//
//  Created by Gabriel Theodoropoulos on 8/9/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

import UIKit

class CustomSearchBar: UISearchBar {
    
    var preferredFont: UIFont!
    
    var preferredTextColor: UIColor!
    var searchFieldbackgroundColor: UIColor!
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        // Find the index of the search field in the search bar subviews.
        if let index = indexOfSearchFieldInSubviews(fieldName: "txtField") {
            // Access the search field
            let searchField: UITextField = (subviews[0] ).subviews[index] as! UITextField
            
            // Set its frame.
            searchField.frame = CGRect(x: 5.0, y: 5.0, width: frame.size.width - 10.0, height: frame.size.height - 10.0)
            
            // Set the font and text color of the search field.
            searchField.font = preferredFont
            searchField.textColor = preferredTextColor
            
            // Set the background color of the search field.
            searchField.backgroundColor = searchFieldbackgroundColor
            // searchField.backgroundColor = barTintColor
        }
        
        /*
         // Find the index of the search field in the search bar subviews.
         if let index = indexOfSearchFieldInSubviews(fieldName: "searchButton") {
         // Access the search field
         let searchField: UIButton = (subviews[0] ).subviews[index] as! UIButton
         
         // Set its frame.
         searchField.frame = CGRect(x: 5.0, y: 5.0, width: frame.size.width - 10.0, height: frame.size.height - 10.0)
         
         // Set the font and text color of the search field.
         //  searchField.font = preferredFont
         //  searchField.textColor = preferredTextColor
         
         // Set the background color of the search field.
         searchField.backgroundColor = barTintColor
         }
         */
        let startPoint = CGPoint(x: 0.0, y: frame.size.height)
        let endPoint = CGPoint(x: frame.size.width, y: frame.size.height)
        let path = UIBezierPath()
        path.move(to: startPoint)
        path.addLine(to: endPoint)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = preferredTextColor.cgColor
        shapeLayer.lineWidth = 2.5
        
        layer.addSublayer(shapeLayer)
        
        super.draw(rect)
    }
    
    
    
    convenience init(frame: CGRect, font: UIFont, textColor: UIColor) {
        
        
        self.init(frame: frame,font: font,textColor: textColor,searchFiledBgColor: UIColor.clear)
        
    }
    
    
    init(frame: CGRect, font: UIFont, textColor: UIColor , searchFiledBgColor :UIColor) {
        super.init(frame: frame)
        
        self.frame = frame
        preferredFont = font
        preferredTextColor = textColor
        searchFieldbackgroundColor = searchFiledBgColor
        searchBarStyle = UISearchBarStyle.prominent
        isTranslucent = false
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    func indexOfSearchFieldInSubviews(fieldName: String) -> Int! {
        // Uncomment the next line to see the search bar subviews.
        // println(subviews[0].subviews)
        
        var index: Int!
        let searchBarView = subviews[0]
        
        
        
        for i in 0 ..< searchBarView.subviews.count  {
            if fieldName == "txtField" {
                
                if searchBarView.subviews[i].isKind(of: UITextField.self) {
                    index = i
                    break
                }
            }else if fieldName == "searchButton" {
                if searchBarView.subviews[i].isKind(of: UIButton.self){
                    
                    index = i
                    break
                    
                }
                
                
                
            }
        }
        
        
        // another loop do nothing
        for innerSubview in searchBarView.subviews {
            if innerSubview is UITextField {
                //innerSubview.backgroundColor = UIColor.YOUR_COLOR_HERE
            }
        }
        
        
        return index
    }
}
