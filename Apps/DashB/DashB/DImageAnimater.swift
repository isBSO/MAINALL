//
//  DImageAnimater.swift
//  DashB
//
//  Created by is isBSO on 8/10/17.
//  Copyright © 2017 isBSO. All rights reserved.
//

import UIKit

class DImageAnimater: NSObject {
    static let shared = DImageAnimater()
    
    var transitioningImageView: UIImageView = UIImageView()
    var startingRect:CGRect?
    var  endingRect:CGRect?
    func startAnimating()  {
        transitioningImageView.frame = DImageAnimater.shared.startingRect!
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            // your code here
            UIApplication.topViewController()?.view.addSubview(self.transitioningImageView);
         
            UIView.animate(withDuration: 0.25) {
                self.transitioningImageView.frame = DImageAnimater.shared.endingRect!
                self.transitioningImageView.alpha = 1.0
            }
        }
        
        
        
    }
    func CGRectMake(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {
        return CGRect(x: x, y: y, width: width, height: height)
    }
    

}
