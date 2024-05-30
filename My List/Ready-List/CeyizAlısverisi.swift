//
//  CeyizAlısverisi.swift
//  My List
//
//  Created by Senanur EMİR on 7.05.2024.
//

import SwiftUI

struct CeyizAlisverisiView: View {
    
    let mutfakCeyizi = [
        "Tencere ve tava seti",
        "6 Kişilik Yemek Takımı",
        "12 Kişilik Yemek Takımı",
        "Bardak ve içecek bardakları",
        "6 Kişilik Çatal bıçak takımı",
        "12 Kişilik Çatal bıçak takımı",
        "Kesme tahtası ve bıçak seti",
        "Tava spatulası ve kepçe",
        "Runner",
        "Blender veya mikser",
        "Su ısıtıcısı ve kahve makinesi",
        "Tost makinesi",
        "Pişirme tepsileri ve kalıplar",
        "Mutfak tartısı",
        "Saklama kapları",
        "Mutfak ölçüm kupaları ve kaşık seti",
        "Mutfak havlusu ve sünger"
    ];

    @State private var selectedItems = Set<String>()
    @State private var addedToList = false
    @EnvironmentObject var listsViewModel: ListsViewModel

    
    var body: some View {
        VStack {
            List {
                ForEach(mutfakCeyizi, id: \.self) { item in
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
                listsViewModel.addPredefinedList(name: "Çeyiz Alışverişi 🛍️", items: mutfakCeyizi )
            }) {
                Text("Kendi Listeme Ekle")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.accentColor)
                    .cornerRadius(8)
            }
            
        }
        .navigationBarTitle("Çeyiz Alışverişi")
    }
}

struct CeyizAlisverisiView_Previews: PreviewProvider {
    static var previews: some View {
        CeyizAlisverisiView()
    }
}

