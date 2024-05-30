//
//  ReadyListView.swift
//  My List
//
//  Created by Senanur EMİR on 3.05.2024.
//

import SwiftUI

struct ReadyListView: View {
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Hazır Listeler ✅")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, -80)
                    
                List(ReadyListList, id: \.self) { list in
                    NavigationLink(destination: destinationViewForList(listName: list)) {
                        HStack {
                            Image(systemName: "checklist")
                            Text(list)
                        }
                    }
                    .padding()
                }
                .listStyle(PlainListStyle())
                .padding(.top, -40)
            }
        }
    }
    
    private func destinationViewForList(listName: String) -> some View {
        switch listName {
        case "Market Alışverişi 🍏🛒":
            return AnyView(MarketAlisverisiView())
        case "Çeyiz Alışverişi 🛍️":
            return AnyView(CeyizAlisverisiView())
        case "Yeni Doğan Alışverişi 👶🏻":
            return AnyView(YeniDoganAlisverisiView())
        case "Asker Alışverişi":
            return AnyView(AskerAlisverisiView())
        case "Tatilde Yanıma Neler Alacağım":
            return AnyView(TatilAlisverisiView())
        case "Hangi Odalar Temiz 🧽🪣":
            return AnyView(TemizOdaView())
        case "Hayalimdeki Ülkeler 🏝️":
            return AnyView(HayalimdeUlkelerView())
            
        default:
            return AnyView(Text("Belirtilen liste için sayfa bulunamadı"))
        }
    }
}

struct ReadyListView_Previews: PreviewProvider {
    static var previews: some View {
        ReadyListView()
    }
}
