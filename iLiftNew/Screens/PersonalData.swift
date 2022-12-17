//
//  PersonalInfo.swift
//  SigninV2
//
//  Created by akotecha on 11/30/22.
//

import SwiftUI
import Firebase

import SwiftUI


struct PersonalData: View {


    @State var username: String = ""
    @State var password: String = ""
    @State public var age: String = ""
    @State public var feet: String = ""
    @State public var inches: Int?
    @State public var weight: String = ""
    let blueColor = Color(red: 44/255, green: 85/255, blue: 211/255)
    let purpleColor = Color(red: 146/255, green: 142/255, blue: 211/255)
    let darkPurple = Color(red: 146/255 * 1.2 , green: 142/255 * 1.2, blue: 211/255 * 1.2)


    
    @State private var genderSelection = "male"
    @State private var goalSelection = "Build"
    let sexes = ["Male","Female"]
    
    
    //new adds all other info to firebase
    func addPersonalInfo() {
        /*
       let db = Firestore.firestore()
        
        db.collection("users").document(userID).updateData([
            "age": age,
            "feet": feet,
            "inches": inches,
            "weight": weight,
            "sex": genderSelection,
            "goal": goalSelection
            
        ]) {err in
            if let err = err{
                print("Error adding document data")
            } else {
                print("Data added!")
            }
        }
         */
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
                    .frame(width: 125, height: 18).offset(y:390)
                    
            }
            .foregroundColor(.white)
            //.padding(.horizontal,20)
      
                //  Form
                VStack{
                    Text("Tell Us About Yourself")
                        .font(.custom("Futura", size: 18))
                        .foregroundColor(darkPurple)
                        .bold()
                        .background(Capsule().fill(Color.black).frame(width: 350, height: 60).opacity(0.3))
                        .offset(y: 30)
                    VStack{
                        Text("Age")
                            .font(.custom("Futura", size: 18))
                            .foregroundColor(.white)
                            .opacity(0.6)
                            .offset(y: -170)
                            .offset(x: -120)
                        
                        TextField("Age", text: $age)
                            .offset(x: 60)
                            .offset(y: -150)
                            .foregroundColor(purpleColor)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(Color.clear)
                                    .frame(width: 140, height: 60)
                                    .border(Color.white, width: 2)
                                    .opacity(0.6)
                                    .offset(x: -80)
                                    .offset(y: -150)
                            )
                        Text("Weight")
                            .font(.custom("Futura", size: 18))
                            .foregroundColor(.white)
                            .opacity(0.6)
                            .offset(x: 40)
                            .offset(y: -237)
                        TextField("Pounds", text: $weight)
                            .offset(x: 220)
                            .offset(y: -218)
                            .foregroundColor(purpleColor)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(Color.clear)
                                    .frame(width: 140, height: 60)
                                    .border(Color.white, width: 2)
                                    .opacity(0.6)
                                    .offset(x: 80)
                                    .offset(y: -218)
                            )
                    }
                    .offset(y: 250)
                    
                    VStack{
                        Text("Height")
                            .font(.custom("Futura", size: 18))
                            .foregroundColor(.white)
                            .opacity(0.6)
                            .offset(y: -180)
                            .offset(x: -115)
                    HStack{
                        TextField("Feet", text: $feet)
                            .offset(x: 60)
                            .offset(y: -160)
                            .foregroundColor(purpleColor)
                            .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color.clear)
                                .frame(width: 140, height: 60)
                                .border(Color.white, width: 2)
                                .opacity(0.6)
                                .offset(y: -160)
                                .offset(x: 20)
                                
                            )
                            
                        TextField("Inches", value: $inches,format:.number)
                            .offset(x: 25)
                            .offset(y: -160)
                            .foregroundColor(purpleColor)
                            .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color.clear)
                                .frame(width: 130, height: 60)
                                .border(Color.white, width: 2)
                                .opacity(0.6)
                                .offset(y: -160)
                                .offset(x: -25)
                                
                            )
                        }


            }
                    .offset(y: 250)
    VStack{
        Text("What Are Your Goals?")
             .font(.custom("Futura", size: 18))
             .foregroundColor(.white)
             .opacity(0.6)
             //.offset(y: 20)
        Picker("Selection", selection: $goalSelection) {
                            Text("Tone").tag("Tone")
                            Text("Build").tag("Build")
                            Text("Maintain").tag("Maintain")
                        }
                        .pickerStyle(SegmentedPickerStyle())
        if goalSelection == "Tone" {
            GeometryReader { geo in
                Text("● Focus on toning specific muscle groups")
                    .frame(height: geo.size.height)
                    .font(.custom("Futura", size: 18))
                    .foregroundColor(.white)
                    .opacity(0.8)
                    
            }
            
            GeometryReader { geo in
                Text("")
            }
            GeometryReader { geo in
                Text("")
            }
             
            GeometryReader { geo in
                Text("● Use of lighter weights \n and higher repetitions")
                    .frame(height: geo.size.height)
                    .frame(height: geo.size.height)
                    .font(.custom("Futura", size: 18))
                    .foregroundColor(.white)
                    .opacity(0.8)
                  
            }
            GeometryReader { geo in
                Text("")
            }
            GeometryReader { geo in
                Text("")
            }
            GeometryReader { geo in
                Text("● Incorporate exercises for balance and stability")
                    .frame(height: geo.size.height)
                    .frame(height: geo.size.height)
                    .font(.custom("Futura", size: 18))
                    .foregroundColor(.white)
                    .opacity(0.8)
                
            }
        } else if goalSelection == "Build" {
            GeometryReader { geo in
                Text("● Focus on increasing muscle size and strength")
                    .frame(height: geo.size.height)
                    .frame(height: geo.size.height)
                    .font(.custom("Futura", size: 18))
                    .foregroundColor(.white)
                    .opacity(0.8)
            }
            GeometryReader { geo in
                Text("")
            }
            GeometryReader { geo in
                Text("")
            }
            GeometryReader { geo in
                Text("● Use of heavier weights and lower repetitions")
                    .frame(height: geo.size.height)
                    .frame(height: geo.size.height)
                    .font(.custom("Futura", size: 18))
                    .foregroundColor(.white)
                    .opacity(0.8)
            }
            GeometryReader { geo in
                Text("")
            }
            GeometryReader { geo in
                Text("")
            }
            GeometryReader { geo in
                Text("● Incorporate progressive overload in training")
                    .frame(height: geo.size.height)
                    .frame(height: geo.size.height)
                    .font(.custom("Futura", size: 18))
                    .foregroundColor(.white)
                    .opacity(0.8)
            }
        } else if goalSelection == "Maintain" {
            GeometryReader { geo in
                Text("● Focus on maintaining current muscle mass and fitness level")
                    .frame(height: geo.size.height)
                    .frame(height: geo.size.height)
                    .font(.custom("Futura", size: 18))
                    .foregroundColor(.white)
                    .opacity(0.8)
            }
            GeometryReader { geo in
                Text("")
            }
            GeometryReader { geo in
                Text("")
            }
            GeometryReader { geo in
                Text("● Incorporate a mix of cardio and strength training")
                    .frame(height: geo.size.height)
                    .frame(height: geo.size.height)
                    .font(.custom("Futura", size: 18))
                    .foregroundColor(.white)
                    .opacity(0.8)
            }
            GeometryReader { geo in
                Text("")
            }
            GeometryReader { geo in
                Text("")
            }
            GeometryReader { geo in
                Text("● Prioritize recovery and rest in training")
                    .frame(height: geo.size.height)
                    .frame(height: geo.size.height)
                    .font(.custom("Futura", size: 18))
                    .foregroundColor(.white)
                    .opacity(0.8)
            }
        } else {
            GeometryReader { geo in
                Text("")
                    .frame(height: geo.size.height)
            }
        }
    }
    .offset(y: 220)
                   
                HStack{
                    Picker("Sex", selection: $genderSelection) {
                        ForEach(sexes, id: \.self) {
                            Text($0)
                        }
                    }
                        .pickerStyle(.segmented)
                        .accentColor(.white)
                        .frame(width: 250, height: 400, alignment: .leading)
                        .offset(y: -280)
                        
                            
                    }
                    .offset(y: 100)
                }.navigationBarBackButtonHidden(true)
           
                
                    
            
            
               VStack{
                //  Button SignIn
                NavigationLink(destination: HomeView().onAppear()
                {
                    addPersonalInfo()
                }
                               , label: {Text("Submit")
                    .modifier(CustomTextM(fontName: "Futura", fontSize: 22, fontColor: .white))}).frame(maxWidth:.infinity, maxHeight: 60)
                       .background(Capsule().fill(blueColor).frame(width: 180, height: 50))
                    .offset(y: 340)
            }
         
                    
            
            
            
        }
    }
    struct PersonalData_Previews: PreviewProvider {
        static var previews: some View {
            PersonalData()
        }
    }
}
