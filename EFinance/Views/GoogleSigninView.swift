//
//  GoogleSigninView.swift
//  EFinance
//
//  Created by connor dong on 2021-05-05.
//

import SwiftUI
import Firebase
import GoogleSignIn

struct GoogleSignView : UIViewRepresentable {
    
    func makeUIView(context: UIViewRepresentableContext<GoogleSignView>) -> GIDSignInButton
    {
        
        let button = GIDSignInButton()
        button.colorScheme = .dark
        GIDSignIn.sharedInstance()?.presentingViewController = UIApplication.shared.windows.last?.rootViewController
        return button
        
    }
    
    func updateUIView(_ uiView: GIDSignInButton, context: UIViewRepresentableContext<GoogleSignView>) {
        
        
    }
}
struct Logout : View {
    
    var body : some View{
        
        VStack{
            Button(action: {
                
                
                try! Auth.auth().signOut()
                GIDSignIn.sharedInstance()?.signOut()
                UserDefaults.standard.set(false, forKey: "status")
                NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
                
            }) {
                
                Text("Logout").padding(.vertical, 5)
                    .padding(.horizontal, 5)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .font(.system(size: 15, weight: .heavy))
                    .cornerRadius(10)
            }
        }
    }
}
struct Logout_Previews: PreviewProvider {
    static var previews: some View {
        Logout()
    }
}

