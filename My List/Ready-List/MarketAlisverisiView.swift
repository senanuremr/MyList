//
//  MarketAlisverisiView.swift
//  My List
//
//  Created by Senanur EMİR on 7.05.2024.
//

import SwiftUI

struct MarketAlisverisiView: View {
    let marketItems = [
        "Süt", "Yumurta", "Ekmek", "Elma", "Muz", "Portakal",
        "Domates", "Salatalık", "Peynir", "Tavuk göğsü", "Makarna",
        "Pirinç", "Zeytinyağı", "Tuvalet kağıdı", "El Sabunu"
    ]
    @State private var selectedItems = Set<String>()
    @State private var addedToList = false
    @EnvironmentObject var listsViewModel: ListsViewModel

    
    var body: some View {
        VStack {
            List {
                ForEach(marketItems, id: \.self) { item in
                    HStack {
                        Image(systemName: self.selectedItems.contains(item) ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(self.selectedItems.contains(item) ? .green : .black)
                            .onTapGesture {
                                if self.selectedItems.contains(item) {
                                    self.selectedItems.remove(item)
                                } else {
                                    self.selectedItems.insert(item)
                                }
                            }
                        Text(item)
                    }
                }
            }
            .listStyle(InsetListStyle())
            
            Spacer()
            
            Button(action: {
                listsViewModel.addPredefinedList(name: "Market Alışverişi 🍏🛒", items: marketItems)
            }) {
                Text("Kendi Listeme Ekle")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.accentColor)
                    .cornerRadius(8)
            }
            
        }
        .navigationBarTitle("Market Alışverişi")
    }
    
}


struct MarketAlisverisiView_Previews: PreviewProvider {
    static var previews: some View {
        MarketAlisverisiView().environmentObject(ListsViewModel())
    }
}

