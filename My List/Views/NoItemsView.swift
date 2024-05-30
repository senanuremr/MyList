//
//  NewItemsView.swift
//  My List
//
//  Created by Senanur EMİR on 29.04.2024.
//

import SwiftUI

struct NoItemsView: View {
    @State var animate: Bool = false
    @State private var isAddingNewList = false
    let secondaryColor = Color("SecondaryAccentColor")
    @EnvironmentObject var listsViewModel: ListsViewModel

    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("Hiçbir öğen yok!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Kendi listemi kendim oluştururum diyenlerden misin? Hadi Başlayalım")
                    .padding(.bottom, 20)
                NavigationLink(destination: NewListNameView(isAddingNewList: $isAddingNewList).environmentObject(listsViewModel)) {
                    Text("Listeni Oluştur 🥳")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? secondaryColor : Color.accentColor)
                        .cornerRadius(10)
                }
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(
                    color: animate ? secondaryColor.opacity(0.7) : Color.accentColor.opacity(0.7),
                    radius: animate ? 30 : 10,
                    x: 0,
                    y: animate ? 50 : 30)
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
                
            }
        
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(Animation.easeInOut(duration: 2.0).repeatForever()) {
                animate.toggle()
            }
        }
    }
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoItemsView()
                .environmentObject(ListsViewModel())  
                .navigationTitle("TITLE")
        }
    }
}
