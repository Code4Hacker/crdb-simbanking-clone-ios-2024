//
//  File.swift
//  SIMBANKING
//
//  Created by Gemini Child on 01/04/2024.
//

import Foundation

struct CustomerBottomView: Identifiable{
    let id = NSUUID().uuidString
    let image: String?
    let description: String?
    
    init(image: String?, description: String?) {
        self.image = image
        self.description = description
    }
}
