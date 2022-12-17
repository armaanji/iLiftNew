//
//  AddCoach.swift
//  iLiftNew
//
//  Created by akotecha on 1/17/23.
//


import SwiftUI


struct AddCoach: View {
    @State private var enteredPin = ""
    @State private var errorMessage = ""
    
    var body: some View {
        
        Form {
            Text("Enter Your Coach's PIN")
                .font(.title)
                .padding()
            Section {
                TextField("Enter Pin", text: $enteredPin)
                    .keyboardType(.numberPad)
                    .font(.largeTitle)
                    .frame(width: 150, height: 50)
                    .textContentType(.oneTimeCode)
                    .multilineTextAlignment(.center)
                Button("Done", action: {
                    checkPin()
                })
            }
            if !errorMessage.isEmpty {
                Text(errorMessage)
                    .font(.body)
                    .foregroundColor(.red)
                    .padding()
            }
            
            Text("Find a Coach")
                .font(.title)
                .padding()
            Section {
                Button("Search for Coaches", action: {
                    //Add Search Feature for Searching for Coaches near you
                })
                
            }
            
            
            
        }
    }
    func checkPin() {
           if enteredPin == "1234" {
               "You are connected to your coach"
           } else {
               errorMessage = "Incorrect PIN. Please try again."
           }
       }
    }


    




struct AddCoach_Previews: PreviewProvider {
    static var previews: some View {
        AddCoach()
    }
}

