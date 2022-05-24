//
//  Character.swift
//  Rinha
//
//  Created by Daniella Onishi on 21/05/22.
//

import Foundation
import SwiftUI

enum Character: String, CaseIterable {
    case rat = "rat"
    case llama = "llama"
    case redPanda = "redPanda"
    case duck = "duck"
//    case fish = "fish"
    
    var characterImage: String {
        //return "\(rawValue)"
        return "\(rawValue)_character_image"
    }
    
    var characterGif: String {
        //return "\(rawValue)"
        return "\(rawValue)_gif"
    }
    
    var carouselImageSmall: String {
        return "\(rawValue)_carousel_image_small"
    }
    
    var carouselImageBig: String {
        return "\(rawValue)"
//        return "\(rawValue)_carousel_image_big"
    }
    
    var upperPlank: String {
        return "\(rawValue)_upper_plank"
    }
    
    var underPlank: String {
        return "\(rawValue)_under_plank"
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
        return "\(rawValue)_info"
    }
    
    var characterTagImage: String {
        return "\(rawValue)_tag"
    }
    
    
    var animalSound: String {
        switch self {
        case .rat:
            return "Rat-Sound"
        case .llama:
            return "Llama-Sound"
        case .redPanda:
            return "Red-Panda-Sound"
        case .duck:
            return "Meerkat-Sound"
//        case .fish:
//            return "Fish-Sound"
        }
    }
}
