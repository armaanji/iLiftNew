//
//  ForgotPasswordView.swift
//  iLiftNew
//
//  Created by akotecha on 1/13/23.
//


import SwiftUI
import FirebaseAuth


struct ForgotPasswordView: View {
    @State private var email = ""
    @State private var error: String?


    var body: some View {
        NavigationView{
            Form {
                Section {
                    TextField("Email", text: $email)
                    /**
                     .padding()
                     .background(Color.white)
                     .cornerRadius(5.0)
                     .shadow(radius: 5.0)
                     */
                    Button(action: {
                        self.resetPassword()
                    }) {
                        Text("Reset Password")
                    }
                    /**
                     .padding()
                     .background(Color.blue)
                     .foregroundColor(Color.white)
                     .cornerRadius(5.0)
                     .shadow(radius: 5.0)
                     */
                    
                    if error != nil {
                        Text(error!)
                            .padding()
                            .foregroundColor(Color.red)
                    }
                }
                .background(Color.white)
        }
            .padding(.top, 25)
        .navigationBarTitle("Forgot Password")
        
    }
    .background(Color.white)
}


    func resetPassword() {
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            if let error = error {
                self.error = error.localizedDescription
            } else {
                self.error = nil
            }
        }
    }
}




struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}




