//
//  MainView.swift
//  My List
//
//  Created by Senanur EMİR on 27.04.2024.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
        Group {
            if viewModel.userSession != nil {
                mainTabView
            } else {
                LoginView()
            }
        }
    }

    var mainTabView: some View {
        TabView {
            NavigationView {
                ListsView()
            }
            .tabItem {
                Label("Listelerim", systemImage: "checklist")
            }
            
            NavigationView {
                ReadyListView()
            }
            .tabItem {
                Label("Keşfet", systemImage: "doc.text.magnifyingglass")
            }
            
            NavigationView {
                ProfileView()
            }
            .tabItem {
                Label("Profilim", systemImage: "person.crop.artframe")
            }
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

enum Tab: String, CaseIterable{
    case Mylist = "checklist"
    case Search = "doc.text.magnifyingglass"
    case Profile = "person.crop.artframe"
 
   
    
    var Tabname: String{
        switch self{
        case.Mylist:
            return ""
        case.Search:
            return ""
        case.Profile:
            return ""
        
            
        }
    }
}


extension View{
    func getSafeArea() -> UIEdgeInsets{
        guard let screen = UIApplication.shared.connectedScenes.first as?
                UIWindowScene else{
            return .zero
        }
        guard let safeArea = screen.windows.first?.safeAreaInsets else{
            return .zero
        }
        return safeArea
    }
}

struct MaterialEffect: UIViewRepresentable{
    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView{
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(ListsViewModel())
            .environmentObject(AuthViewModel())
    }
}
