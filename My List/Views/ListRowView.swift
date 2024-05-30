//
//  ListRowView.swift
//  My List
//
//  Created by Senanur EMİR on 28.04.2024.
//

import SwiftUI

struct ListRowView: View {
    
    let item : ItemModel
    
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.body)
        .padding(.vertical, 8)
    }
}

struct ListRowView_Previews: PreviewProvider{
    
    static var item1 = ItemModel(title: "İlk Madde", isCompleted: false)
    static var item2 = ItemModel(title: "İkinci Madde", isCompleted: true)
                                 
    static var previews: some View {
        Group{
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
        .previewLayout(.sizeThatFits)
    }
}

