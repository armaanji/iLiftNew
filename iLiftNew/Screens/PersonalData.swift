//
//  PersonalInfo.swift
//  SigninV2
//
//  Created by akotecha on 11/30/22.
//

import SwiftUI
import Firebase

struct PersonalData: View {

    @State var username: String = ""
    @State var password: String = ""
    @State public var age: String = ""
    @State public var feet: String = ""
    @State public var inches: String = ""
    @State public var weight: String = ""
    
    
    @State private var selection = "male"
    let sexes = ["Male","Female"]
    
    
    //new adds all other info to firebase
    func addPersonalInfo() {
        let db = Firestore.firestore()
        
        db.collection("users").document(userID).updateData([
            "age": age,
            "feet": feet,
            "inches": inches,
            "weight": weight,
            "sex": selection,
            
        ]) {err in
            if let err = err{
                print("Error adding document data")
            } else {
                print("Data added!")
            }
        }
    }
    
    
    var body: some View {
        ZStack{
            //  BG
            Image("calm")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                //  logo
                Image("logo-6")
                    .resizable()
                    .frame(width: 166.14, height: 26)
                    
            }
            .foregroundColor(.white)
            //.padding(.horizontal,20)
            .padding(.bottom,700)
                //  Form
                VStack{
                    Label {
                        CustomTextfield(placeholder: Text("      Age"), fontName: "NunitoSans-Bold", fontSize: 16, fontColor: Color.white, foregroundColor: Color.white, username: $age)
                    } icon: {
                       
                    }.frame(height: 45)
                    .overlay(Rectangle().stroke(Color.white, lineWidth: 0.5).frame(height: 45))
                    
                    
                    HStack{
                        Text("     Sex:")
                            .modifier(CustomTextM(fontName: "NunitoSans-Bold", fontSize: 18, fontColor: Color.white))
                        
                        Picker("Sex", selection: $selection) {
                            ForEach(sexes, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.menu)
                        .accentColor(.white)
                        
                        
                            
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    
                    HStack{
                        Text("      Height")
                            .modifier(CustomTextM(fontName: "NunitoSans-Bold", fontSize: 16, fontColor: Color.white))
                        Label {
                            CustomTextfield(placeholder: Text("   Feet"), fontName: "NunitoSans-Bold", fontSize: 16, fontColor: Color.white, username: $feet)
                        } icon: {
                            
                        }.frame(height: 45)
                            .overlay(Rectangle().stroke(Color.white, lineWidth: 0.5).frame(height: 45))
                        
                        Label {
                            CustomTextfield(placeholder: Text("   Inches"), fontName: "NunitoSans-Bold", fontSize: 16, fontColor: Color.white, username: $inches)
                        } icon: {
                            
                        }.frame(height: 45)
                            .overlay(Rectangle().stroke(Color.white, lineWidth: 0.5).frame(height: 45))
                    }
                    
                    Label {
                        CustomTextfield(placeholder: Text("      Weight"), fontName: "NunitoSans-Bold", fontSize: 16, fontColor: Color.white, username: $weight)
                    } icon: {
                        
                    }.frame(height: 45)
                        .overlay(Rectangle().stroke(Color.white, lineWidth: 0.5).frame(height: 45))
                    
                    
                    
                }
                .padding(.bottom, 300)
                .padding(.top,100)
                
                    
            
            
            VStack{
                //  Button SignIn
                NavigationLink(destination: Goals().onAppear()
                {
                    addPersonalInfo()
                }
                               , label: {Text("NEXT")
                    .modifier(CustomTextM(fontName: "NunitoSans-Bold", fontSize: 18, fontColor: Color.black))}).frame(maxWidth:.infinity, maxHeight: 60)
                    .background(Color.white)
            }
            .padding(.top,600)
                    
            
            
            
        }
    }
}

struct PersonalData_Previews: PreviewProvider {
    static var previews: some View {
        PersonalData()
    }
}
//second tab, sex, age, weight, height and then excersise frequency (number of days a week in dropdown menu) another nedxt button to take you to goals
