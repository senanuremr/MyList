//
//  TemizOda.swift
//  My List
//
//  Created by Senanur EMİR on 7.05.2024.
//

import SwiftUI

struct TemizOdaView: View {
    let temizlenecekOdaListesi = [
        "Yatak Odası",
        "Banyo",
        "Mutfak",
        "Oturma Odası",
        "Misafir Odası",
        "Çocuk Odası",
        "Çalışma Odası",
        "Kiler veya Depo",
        "Teras veya Balkon",
        "Koridor veya Merdiven",
    ];


    @State private var selectedItems = Set<String>()
    @State private var addedToList = false
    @EnvironmentObject var listsViewModel: ListsViewModel

    var body: some View {
        VStack {
            List {
                ForEach(temizlenecekOdaListesi, id: \.self) { item in
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
                listsViewModel.addPredefinedList(name: "Hangi Odalar Temiz 🧽🪣", items: temizlenecekOdaListesi )
            }) {
                Text("Kendi Listeme Ekle")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.accentColor)
                    .cornerRadius(8)
            }
            
        }
        .navigationBarTitle("Temiz Odalar")
    }
}

struct TemizOdaView_Previews: PreviewProvider {
    static var previews: some View {
        TemizOdaView()
    }
}
