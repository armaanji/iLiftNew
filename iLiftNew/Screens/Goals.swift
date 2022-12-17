//
//  GoalsV2.swift
//  SigninV2
//
//  Created by akotecha on 12/3/22.
//

import SwiftUI
import Firebase

//Just make this page look better, kinda looks like garbage
 
struct Goals: View {
    @State var choiceMade = "options"
    
    
    //New added to store your goals to firebase
    func addGoals(){
        let db = Firestore.firestore()
        
        db.collection("users").document(userID).updateData([
            "goals": choiceMade
            
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
            Image("calm")
                .resizable()
                .edgesIgnoringSafeArea(.all)
        
        VStack{
            Text("What are your Goals").modifier(CustomTextM(fontName: "NunitoSans-Bold",fontSize: 36,fontColor: .black))
            
            Menu{
                Button(action: {
                    choiceMade = "Bulk"}, label:{
                        
                        Text("Bulk")
                    })
                Button(action: {
                    choiceMade = "Cut"}, label:{
                        
                        Text("Cut")
                    })
                Button(action: {
                    choiceMade = "Maintain"}, label:{
                        
                        Text("Maintain")
                    })
            } label: {
                Label(
                    title: {Text("\(choiceMade)").modifier(CustomTextM(fontName: "NunitoSans-Bold",fontSize: 24,fontColor: .black))},
                    icon: {Image(systemName: "plus")}
                )
                
            }
            if (choiceMade == "Bulk"){
                Text("Gain Size and Muscle Through Increased Caloric Intake").modifier(CustomTextM(fontName: "NunitoSans-Bold",fontSize: 25,fontColor: .black))
            }else if (choiceMade == "Cut"){
                Text("Lose Fat Through Decreased Caloric Intake").modifier(CustomTextM(fontName: "NunitoSans-Bold",fontSize: 25,fontColor: .black))
            }else if(choiceMade == "Maintain"){
                Text("    Replace Fat With Muscle Through Stable Caloric Intake").modifier(CustomTextM(fontName: "NunitoSans-Bold",fontSize: 25,fontColor: .black))
            }
            Spacer()
            NavigationLink(destination: HomeView().onAppear()
            {
                addGoals()
            }
                           , label: {Text("Create Account")
                .modifier(CustomTextM(fontName: "NunitoSans-Bold", fontSize: 18, fontColor: Color.black))}).frame(maxWidth:.infinity, maxHeight: 60)
                .background(Color.white)
                
        
        }
        
        }
        
    }
    }

 
struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        Goals()
    }
}

