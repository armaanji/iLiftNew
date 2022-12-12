//
//  AccountInfo.swift
//  SigninV2
//
//  Created by akotecha on 11/30/22.
//

import SwiftUI
import Firebase

public var userID = ""

struct AccountInfo: View {
    @State var email: String = ""
    @State var password: String = ""
    @State public var first: String = ""
    @State public var last: String = ""
   
    

    static var loginStatus = "SIGN UP FAILURE"
    
    
    //Create account and creates a new document in the users collection with your user id. In this document, it adds your first and last name
    public func SignUp() {
          Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
              if error != nil {
                  print(error?.localizedDescription ?? "")
              } else {
                  print("success")
                  AccountInfo.loginStatus = "SIGNIN SUCCESS"
                  
                  let db = Firestore.firestore()
                  
                  
                  db.collection("users").document(result!.user.uid).setData([
                    "first": first,
                    "last": last,
                    "uid": result!.user.uid
                  ]) {err in
                      if let err = err {
                          print("Error adding document: \(err)")
                      }else{
                          userID = result!.user.uid
                          print("Document added with ID")
                      }
                  }
                    

              }
          }
      }
    
    var body: some View {
        ZStack{
            Image("calm")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack{
                Text("      iLIFT      ")
                    .modifier(CustomTextM(fontName: "NunitoSans-Bold", fontSize: 26, fontColor: Color.white))
                    .padding(.top,10)
                Text("   Create Your Account   ")
                    .modifier(CustomTextM(fontName: "NunitoSans-Bold", fontSize: 28, fontColor: Color.white))
                    .frame(height: 45)
                    .overlay(Capsule().stroke(Color.white, lineWidth: 2).frame(height: 50))
                   .padding(.top,100)
                 Spacer()
                
                HStack{
                    Label {
                        CustomTextfield(placeholder: Text("First Name"), fontName: "NunitoSans-Bold", fontSize: 16, fontColor: Color.white, foregroundColor: Color.white, username: $first)
                            
                    } icon: {
                        Image(systemName: "person")
                            .frame(width: 14, height: 14)
                            .padding(.leading)
                    }.frame(height: 45)
                        .overlay(Rectangle().stroke(Color.white, lineWidth: 2).frame(height: 45))
                    Label {
                        CustomTextfield(placeholder: Text("Last Name"), fontName: "NunitoSans-Bold", fontSize: 16, fontColor: Color.white, username: $last)
                    } icon: {
                        Image(systemName: "person")
                            .frame(width: 14, height: 14)
                            .padding(.leading)
                    }.frame(height: 45)
                        .overlay(Rectangle().stroke(Color.white, lineWidth: 2).frame(height: 45))
                    
                    
            }
            
                VStack(spacing:0){
                    Label {
                        CustomTextfield(placeholder: Text("Email"), fontName: "NunitoSans-Bold", fontSize: 16, fontColor: Color.white, foregroundColor: Color.white, username: $email)
                    } icon: {
                        Image(systemName: "person")
                            .frame(width: 14, height: 14)
                            .padding(.leading)
                    }.frame(height: 45)
                    .overlay(Rectangle().stroke(Color.white, lineWidth: 2).frame(height: 45))
                    
                    Label {
                        CustomSecureField(placeholder: Text("Password"), fontName: "NunitoSans-Bold", fontSize: 16, fontColor: Color.white, password: $password)
                    } icon: {
                        Image(systemName: "lock")
                            .frame(width: 14, height: 14)
                            .padding(.leading)
                    }.frame(height: 45)
                    .overlay(Rectangle().stroke(Color.white, lineWidth: 2).frame(height: 45))
                    
                }

                Spacer().frame(height: 70)
                NavigationLink(destination: PersonalData().onAppear()
                {
                    SignUp()
                }
                               
                               
                               , label:  {
                icon: do {Image (systemName: "arrow.right").resizable().frame(width:35, height:35).foregroundColor(.white)}
                    
                })
                
                
                
                
            
            }.padding(.bottom, 125)
        }
        }
    
        
    }


struct AccountInfo_Previews: PreviewProvider {
    static var previews: some View {
        AccountInfo()
    }
}
//username, oassword and then renter password then a next button for the next page. that next oage is personal info
//make it look like grubhub then have a create account button that is a nav link to next screen
