//
//  TitleListModel.swift
//  My List
//
//  Created by Senanur EMİR on 2.05.2024.
//

import Foundation

struct TitleListModel {
    var id = UUID()
    var title: String
    var description: String
    var createdDate: Date
    
    
    init(id: UUID = UUID(), title: String, description: String, createdDate: Date) {
        self.id = id
        self.title = title
        self.description = description
        self.createdDate = createdDate
    }
}

