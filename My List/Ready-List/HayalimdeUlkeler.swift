//
//  HayalimdeUlkeler.swift
//  My List
//
//  Created by Senanur EMİR on 7.05.2024.
//

import SwiftUI

struct HayalimdeUlkelerView: View {
    let hayalimdekiUlkeler = [
        "Japonya",
        "İzlanda",
        "Yeni Zelanda",
        "Kanada",
        "Norveç",
        "İsviçre",
        "İskandinav Ülkeleri",
        "Avustralya",
        "İtalya",
        "Fransa",
        "İspanya",
        "Yunanistan",
        "Portekiz",
        "Tayland",
        "Kosta Rika",
        "Peru",
        "Tanzanya",
        "Güney Afrika",
        "Brezilya"
    ];

    @State private var selectedItems = Set<String>()
    @State private var addedToList = false
    @EnvironmentObject var listsViewModel: ListsViewModel

    var body: some View {
        VStack {
            List {
                ForEach(hayalimdekiUlkeler, id: \.self) { item in
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
                listsViewModel.addPredefinedList(name: "Hayalimdeki Ülkeler 🏝️", items: hayalimdekiUlkeler )
            }) {
                Text("Kendi Listeme Ekle")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.accentColor)
                    .cornerRadius(8)
            }
            
        }
        .navigationBarTitle("Hayalimdeki Ülkeler")
    }
}

struct HayalimdeUlkelerView_Previews: PreviewProvider {
    static var previews: some View {
        HayalimdeUlkelerView()
    }
}
