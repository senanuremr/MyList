//
//  TitleButtonView.swift
//  My List
//
//  Created by Senanur EMİR on 2.05.2024.
//

import SwiftUI

struct TitleButtonView: View {
    let TitleListModel : TitleListModel

    var body: some View {
        VStack {
            HStack{
                Text(TitleListModel.title)
                Spacer()
                Image(systemName: "note.text")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 30)
                    .foregroundColor(Color.black)
                    .shadow(color: Color.gray,
                            radius: 100,
                            x: 0,
                            y:0)
                
            }.padding()
            Text("enjoy your stay")
                .font(.body)
                .lineLimit(1)
                .padding(.horizontal)
                .padding(.bottom)
        }
        .frame(maxWidth: .infinity)
            .background(RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .shadow(radius: 2)
            )
            .padding(.horizontal)
    }
}

struct TitleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            TitleButtonView(TitleListModel : TitleListModel(title: "DNA", description: "AAA", createdDate: Date()))
        }
    }
}
