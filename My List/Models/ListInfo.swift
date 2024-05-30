//
//  ListInfo.swift
//  My List
//
//  Created by Senanur EMİR on 11.05.2024.
//

import Foundation

struct ListInfo: Identifiable {
    let id = UUID()
    let name: String
    var listItemsModel: ListItemsViewModel
}
