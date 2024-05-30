//
//  YeniDoganAlısverisi.swift
//  My List
//
//  Created by Senanur EMİR on 7.05.2024.
//

import SwiftUI

struct YeniDoganAlisverisiView: View {
    let yenidoğanIhtiyaclari = [
        "Beşik veya Karyola",
        "Bebek Yatağı İçin Çarşaf, Nevresim ve Uyku Tulumu",
        "Bebek Bezi ve Alt Değiştirme Örtüsü",
        "Bebek Giysileri (Bodysuit, Tulum, Elbise, Çorap, Eldiven, Şapka)",
        "Emzirme Yastığı ve Örtü",
        "Bebek Bezi Değiştirme Çantası",
        "Emzirme Yeleği veya Sütyen",
        "Biberonlar ve Emzikler",
        "Biberon Fırçası",
        "Bez Değiştirme Masası veya Yumuşak Alt Değiştirme Pedleri",
        "Bez Kovası",
        "Emzik Zinciri veya Tutucusu",
        "Bebek Taşıma Gereçleri (Bebek Arabası, Bebek Kanguru, Bebek Tulumu)",
        "Bebeğin Banyo İhtiyaçları (Bebek Şampuanı, Bebek Sabunu, Bebek Losyonu, Bebek Yağı, Bebek Havlusu, Bebek Küveti)",
        "Bebeğin Bakımı İçin Araçlar (Bebek Tırnak Makası, Bebek Saç Fırçası, Burun Aspiratörü)",
        "Emzirme Pedleri",
        "Bebek Beslenme Sandalyesi veya Salıncak",
        "Bebeğin Güneş Kremi ve Şapkası (Gerekiyorsa)",
        "Bebeğin Sağlık Kitapçığı",
        "Bebeğin Oyuncağı (Peluş Oyuncaklar, Yumuşak Bloklar, Müzikli Oyuncaklar)"
    ]


    @State private var selectedItems = Set<String>()
    @State private var addedToList = false
    @EnvironmentObject var listsViewModel: ListsViewModel

    var body: some View {
        VStack {
            List {
                ForEach(yenidoğanIhtiyaclari, id: \.self) { item in
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
            
            Spacer() // Boşluk ekleyerek button'un altına yerleşmesini sağla
            
            Button(action: {
                listsViewModel.addPredefinedList(name: "Yeni Doğan Alışverişi 👶🏻", items: yenidoğanIhtiyaclari )
            }) {
                Text("Kendi Listeme Ekle")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.accentColor)
                    .cornerRadius(8)
            }
            
        }
        .navigationBarTitle("Yeni Doğan Alışverişi")
    }
}

struct YeniDoganAlisverisiView_Previews: PreviewProvider {
    static var previews: some View {
        YeniDoganAlisverisiView()
    }
}



