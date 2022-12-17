////
//  Settings.swift
//  iLiftNew
//
//  Created by akotecha on 1/11/23.
//


import SwiftUI


struct Settings: View {
    @State private var isNotificationsEnabled = true
    @State private var selectedFontSize: CGFloat = 17
    @State private var selectedAccentColor = Color.blue
    let accentColors: [Color] = [.red, .green, .blue, .orange, .pink]




    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("General")) {
                    Toggle(isOn: $isNotificationsEnabled) {
                        Text("Enable Notifications")
                    }
                    
                    Picker(selection: $selectedFontSize, label: Text("Font Size")) {
                        ForEach(17 ..< 30) { (size) in
                            Text("\(size)pt").tag(CGFloat(size))
                        }
                    }
                }
                
                Section(header: Text("Appearance")) {
                    VStack(alignment: .leading) {
                        Text("Accent Color")
                        HStack {
                            ForEach(accentColors, id: \.self) { color in
                                Circle()
                                    .fill(color)
                                    .frame(width: 30, height: 30)
                                    .overlay(
                                        Circle()
                                            .stroke(Color.black, lineWidth: self.selectedAccentColor == color ? 2 : 0)
                                    )
                                    .onTapGesture {
                                        self.selectedAccentColor = color
                                    }
                            }
                        }
                    }
                    
                }
                
                Section(header: Text("Change Info")) {
                    NavigationLink(destination: ForgotPasswordView(), label: {
                        Text("ForgotPassword")


                    })
                    
                    NavigationLink(destination: PersonalData(), label: {
                        Text("Adjust Personal Data")


                    })
                }
                
                Section(header: Text("")) {
                    NavigationLink(destination: AddCoach(), label: {
                        Text("Add Coach")


                    })
                }
            }
            .navigationBarTitle("Settings")
        }
        
    }
}


struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}

