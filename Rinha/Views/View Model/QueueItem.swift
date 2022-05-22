//
//  QueueItem.swift
//  Rinha
//
//  Created by Daniella Onishi on 22/05/22.
//

import Foundation

struct QueueItem {
    var imageName: String
    var isActive: Bool
    
    var id: String {
        imageName
    }
}
