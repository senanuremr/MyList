//
//  TatilAlisverisi.swift
//  My List
//
//  Created by Senanur EMİR on 7.05.2024.
//
import SwiftUI

struct TatilAlisverisiView: View {
    let tatilAlisverisi = [
        "Valiz veya Seyahat Çantası",
        "Kişisel Dokümanlar (Pasaport, Kimlik, Seyahat Belgesi)",
        "Yeterli Miktarda Giysi ve Ayakkabı",
        "Havlu ve Plaj Giysileri",
        "Güneş Kremi ve Güneş Gözlüğü",
        "Şapka veya Başlık",
        "Yüzme Ekipmanları (Şnorkel, Palet, Gözlük)",
        "Kişisel Hijyen Ürünleri (Diş Fırçası, Diş Macunu, Sabun, Şampuan)",
        "İlaçlar ve İlk Yardım Kiti",
        "Elektronik Cihazlar (Cep Telefonu, Tablet, Kamera, Şarj Cihazları)",
        "Plaj Oyunları ve Aktiviteleri (Plaj Voleybol Topu, Frizbi)",
        "Seyahat Rehberi veya Haritalar",
        "Su Geçirmez Kılıf veya Torba",
        "Para ve Banka Kartları",
        "Tatil Planları ve Rezervasyon Belgeleri",
        "Yolculuk İçin Araç ve Ulaşım Belgesi",
        "Yolculuk Sırasında Atıştırmalıklar ve Su",
        "Eğlence ve Dinlenme Malzemeleri (Kitaplar, Müzik Çalar)",
        "Yedek Pil ve Şarj Edilebilir Bataryalar",
        "Kişisel Güvenlik ve Güvenlik Ekipmanları"
    ]


    @State private var selectedItems = Set<String>()
    @State private var addedToList = false
    @EnvironmentObject var listsViewModel: ListsViewModel

    var body: some View {
        VStack {
            List {
                ForEach(tatilAlisverisi, id: \.self) { item in
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
                listsViewModel.addPredefinedList(name: "Tatilde Yanıma Neler Alacağım", items: tatilAlisverisi )
            }) {
                Text("Kendi Listeme Ekle")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.accentColor)
                    .cornerRadius(8)
            }
            
        }
        .navigationBarTitle("Tatil Alışverişi")
    }
}

struct TatilAlisverisiView_Previews: PreviewProvider {
    static var previews: some View {
        TatilAlisverisiView()
    }
}

