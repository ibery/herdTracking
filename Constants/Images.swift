//
//  Images.swift
//  Herd Tracking
//
//  Created by Narkoz on 9.05.2022.
//

import UIKit

enum Images: Int{
    case cow
    case barn
    case myWorks
    
    
    var imageName: String {
        switch self {
        case .cow:
            return "cow"
        case .barn:
            return "barn"
        case .myWorks:
            return "myWorks"
        
        }
    }
    var image: UIImage? {
        return UIImage(named: self.imageName)
    }
}

