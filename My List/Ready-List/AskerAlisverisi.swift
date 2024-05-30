//
//  AskerAlisverisi.swift
//  My List
//
//  Created by Senanur EMİR on 7.05.2024.
//

import SwiftUI

struct AskerAlisverisiView: View {
    let askerIhtiyaclari = [
        "Askeri Üniforma ve Kıyafetler",
        "Askeri Botlar veya Ayakkabılar",
        "Kişisel Hijyen Ürünleri (Diş Fırçası, Diş Macunu, Sabun, Şampuan, Havlu)",
        "Yatak Malzemeleri (Yastık, Nevresim, Çarşaf, Battaniye)",
        "Askeri Ekipmanlar (Kask, Kemer, Sırt Çantası, Taktik El Feneri)",
        "Kişisel Bakım Ürünleri (Traş Makinesi, Tıraş Kremi, Tıraş Fırçası)",
        "İklim ve Hava Koşullarına Uygun Giysiler (Sıcaklık ve Hava Koşullarına Göre)",
        "Askeri Talimat ve Belgeler",
        "Kişisel Kimlik ve Askeri Kimlik Kartı",
        "Kişisel Sağlık Belgeleri ve İlaçlar (Reçeteli İlaçlar, İlaç Listesi)",
        "İletişim Cihazları ve Şarj Cihazları (Cep Telefonu, Tablet, Laptop)",
        "Kişisel Temizlik Malzemeleri (Çamaşır Deterjanı, Temizlik Bezi, Çamaşır Torbası)",
        "Eğlence ve Dinlenme Malzemeleri (Kitaplar, Oyun Kartları, Müzik Çalar)",
        "Güneş Gözlüğü ve Güneş Kremi",
        "İhtiyaç Durumunda İlk Yardım Kiti",
        "Para ve Banka Kartları",
        "Seyahat Belgesi ve Askeri Sevk Belgeleri",
        "Kişisel Eşyalar ve Hatıra Fotoğrafları",
        "Askeri ve Sivil Belge ve Belgeler (Askeri Kimlik, Pasaport, Ehliyet)"
    ];

    @State private var selectedItems = Set<String>()
    @State private var addedToList = false
    @EnvironmentObject var listsViewModel: ListsViewModel

    var body: some View {
        VStack {
            List {
                ForEach(askerIhtiyaclari, id: \.self) { item in
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
                listsViewModel.addPredefinedList(name: "Asker Alışverişi", items: askerIhtiyaclari )
            }) {
                Text("Kendi Listeme Ekle")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.accentColor)
                    .cornerRadius(8)
            }
            
        }
        .navigationBarTitle("Asker Alışverişi")
    }
}

struct AskerAlisverisiView_Previews: PreviewProvider {
    static var previews: some View {
        AskerAlisverisiView()
    }
}

