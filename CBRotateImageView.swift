//
//  CBRotateImageView.swift
//  imobi
//
//  Created by Zoom-Biz on 10/7/16.
//  Copyright © 2016 Zoom-Biz. All rights reserved.
//

import Foundation
import UIKit

class CBRotateImageView: UIImageView {
    
    private let kRotateRight = -M_PI/2
    private let kRotateLeft = M_PI/2
    
    // MARK: - Public properties
    var imageWidth: CGFloat!
    var imageHeight: CGFloat!
    
    // MARK: - Private properties
    private var diagonal: CGFloat!
    private var rotationAngle: CGFloat!
    
    func setImage(image: UIImage) {
        super.image = self.image
        
        self.setFrameToFitImage()
    }
    
    
    // MARK: - Helper Methods
    private func calculateDiagonal() {
        let rect = self.frame
        
        let squareWidth = rect.width * rect.width
        let squareHeight = rect.height * rect.height
        
        diagonal = CGFloat(sqrtf(Float(squareWidth + squareHeight)))
    }
    
    private func setFrameToFitImage() {
        self.frame = (self.superview?.bounds)!
        
        let widthRatio  = self.bounds.size.width / (self.image?.size.width)!
        let heightRatio = self.bounds.size.height / (self.image?.size.height)!
        let scale       = min(widthRatio, heightRatio)
        
        imageWidth  = scale * (self.image?.size.width)!
        imageHeight = scale * (self.image?.size.height)!
        
        self.frame = CGRect(x: 0, y: 0, width: imageWidth, height: imageHeight)
        self.center = CGPoint(x: (self.superview?.frame.width)! / 2, y: (self.superview?.frame.height)! / 2)
        
        self.calculateDiagonal()
    }
    
}
