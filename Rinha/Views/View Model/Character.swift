//
//  Character.swift
//  Rinha
//
//  Created by Daniella Onishi on 21/05/22.
//

import Foundation
import SwiftUI

enum Character: String, CaseIterable {
    case rat = "rato1"
    case llama = "rato2"
    case redPanda = "rato3"
    case meerkat = "rato4"
    case fish = "rato5"
    
    var characterImage: String {
        //return "\(rawValue)"
        return "\(rawValue)_character_image"
    }
    
    var carouselImageSmall: String {
        return "\(rawValue)"
//        return "\(rawValue)_carousel_image_small"
    }
    
    var carouselImageBig: String {
        return "\(rawValue)"
//        return "\(rawValue)_carousel_image_big"
    }
    
    var upperPlank: String {
        return "\(rawValue)"
//        return "\(rawValue)_upper_plank"
    }
    
    var underPlank: String {
        return "\(rawValue)"
//        return "\(rawValue)_under_plank"
    }
    
    var scoreImage: String {
        return "\(rawValue)"
//        return "\(rawValue)_score_image"
    }
    
    var queueImageBig: String {
        return "\(rawValue)"
//        return "\(rawValue)_queue_image_big"
    }
    
    var queueImageSmall: String {
        return "\(rawValue)"
//        return "\(rawValue)_queue_image_small"
    }
    
    var characterInfoImage: String {
        return "\(rawValue)"
//        return "\(rawValue)_character_info_image"
    }
    
    var animalSound: String {
        switch self {
        case .rat:
            return "Rat-Sound"
        case .llama:
            return "Llama-Sound"
        case .redPanda:
            return "Red-Panda-Sound"
        case .meerkat:
            return "Meerkat-Sound"
        case .fish:
            return "Fish-Sound"
        }
    }
}
