//
//  ContentView.swift
//  EFinance
//
//  Created by connor dong on 2021-05-04.
//

import SwiftUI

struct ContentView: View {
    @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    
    var body: some View
    {
        //HomeView()
        //LoginView()
        VStack{
            
            if status{
                
                HomeView()
            }
            else{
                
                LoginView()
            }
            
        }.animation(.spring())
        .onAppear {
                
            NotificationCenter.default.addObserver(forName: NSNotification.Name("statusChange"), object: nil, queue: .main) { (_) in
                
                let status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
                self.status = status
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
