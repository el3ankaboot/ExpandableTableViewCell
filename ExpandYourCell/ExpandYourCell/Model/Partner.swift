//
//  Partner.swift
//  ExpandYourCell
//
//  Created by Gamal Mostafa on 9/20/20.
//  Copyright © 2020 Orange. All rights reserved.
//

import Foundation
import UIKit

class Partner{
    var image: UIImage
    var name: String
    var genre: String
    var details: String
    
    init(image: UIImage, name:String, genre: String, details:String){
        self.image = image
        self.name = name
        self.genre = genre
        self.details = details
    }
}
