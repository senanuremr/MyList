//
//  ListItem.swift
//  My List
//
//  Created by Senanur EMİR on 3.05.2024.
//

import Foundation

struct ListItem: Identifiable, Codable {
    var id: UUID = UUID()
    var name: String
    var subItems: [ListItem]?
    var isSelected: Bool = false
    var isChecked: Bool = false
    
    enum CodingKeys: String, CodingKey {
        case id, name, subItems, isSelected, isChecked
    }

    init(name: String, subItems: [ListItem]? = nil) {
        self.name = name
        self.subItems = subItems

    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(UUID.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        isSelected = try container.decode(Bool.self, forKey: .isSelected)
        isChecked = try container.decode(Bool.self, forKey: .isChecked)

        
        if let subItemsArray = try container.decodeIfPresent([ListItem].self, forKey: .subItems) {
            subItems = subItemsArray
        } else {
            subItems = nil
        }
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encodeIfPresent(subItems, forKey: .subItems)
        try container.encode(isSelected, forKey: .isSelected)
        try container.encode(isChecked, forKey: .isChecked) 
        
    }
}
