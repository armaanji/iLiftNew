

import Firebase
import SwiftUI
import SwiftUI


struct HomeView: View {
    @State private var protein: CGFloat = 58.0
    @State private var carbs: CGFloat = 53.0
    @State private var fats: CGFloat = 38.0
    @State private var calories: CGFloat = 200.0
    var total: CGFloat {
        return (protein + carbs + fats)
    }
    var totalGoal: CGFloat {
        return (CGFloat(proteinGoal) + CGFloat(carbGoal) + CGFloat(fatGoal))
    }
    let proteinGoal: Int = 100
    let carbGoal: Int = 100
    let fatGoal: Int = 100
    let calorieGoal: CGFloat = 2000
    let orangeColor = Color(red: 222/255, green: 158/255, blue: 54/255)
    let greenColor = Color(red: 23/255, green: 195/255, blue: 178/255)
    let purpleColor = Color(red: 146/255, green: 142/255, blue: 211/255)
    let blueColor = Color(red: 44/255, green: 85/255, blue: 211/255)
    let faintWhite = Color(red: 0.9, green: 0.9, blue: 0.9)
    
    
    var body: some View {
        
        ZStack{
            
            Image("calm")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            
            ZStack{
                
                
                Text("Today's Intake")
                    .font(.custom("Futura", size: 18))
                    .foregroundColor(.white)
                    .rotationEffect(.degrees(90))
                    .offset(x: 230)
                    .offset(y: -99)
                    .opacity(0.7)
                
                Text("\(calories, specifier: "%.0f") / \(calorieGoal, specifier: "%.0f") Calories")
                    .font(.custom("Futura", size: 30))
                    .foregroundColor(.white)
                    .rotationEffect(.degrees(90))
                    .offset(x: 195)
                    .offset(y: -15)
                
                Text("The Breakdown")
                    .font(.custom("Futura", size: 20))
                    .foregroundColor(.white)
                    .rotationEffect(.degrees(90))
                    .offset(x: 130)
                    .offset(y: -90)
                    .opacity(0.7)
                
                Circle()
                    .stroke(Color.white, lineWidth: 10)
                    .frame(width: 115, height: 115)
                
                Circle()
                    .trim(from: 0, to: fats / Double(fatGoal))
                    .stroke(purpleColor, lineWidth: 10)
                    .frame(width: 115, height: 115)
            }
            .rotationEffect(.degrees(-90))
            .offset(y: -100)
            
            ZStack {
                
                Circle()
                    .stroke(Color.white, lineWidth: 12)
                    .frame(width: 150, height: 150)
                
                Circle()
                    .trim(from: 0, to: carbs / Double(carbGoal))
                    .stroke(greenColor, lineWidth: 12)
                    .frame(width: 150, height: 150)
            }
            .rotationEffect(.degrees(-90))
            .offset(y: -100)
            
            ZStack {
                
                Circle()
                    .stroke(Color.white, lineWidth: 15)
                    .frame(width: 190, height: 190)
                
                Circle()
                    .trim(from: 0, to: protein / Double(proteinGoal))
                    .stroke(orangeColor, lineWidth: 15)
                    .frame(width: 190, height: 190)
            }
            .rotationEffect(.degrees(-90))
            .offset(y: -100)
            
            Text("My Fuel")
                .font(.custom("Futura", size: 20))
                .foregroundColor(.white)
                .offset(y: 30)
                .offset(x: -143)
                .opacity(0.9)
            
            ZStack {
                HStack {
                    VStack {
                        Text("PROTEIN    \(protein, specifier: "%.0f") / \(proteinGoal)g")
                            .frame(width: 180, height: 100)
                            .background(orangeColor)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                            .opacity(0.9)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.white, lineWidth: 2)
                            )
                            .font(.custom("Futura", size: 24))
                            .foregroundColor(.white)
                    }
                    VStack {
                        Text("CARBS      \(carbs, specifier: "%.0f") / \(carbGoal)g")
                            .frame(width: 180, height: 100)
                            .background(greenColor)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                            .opacity(0.9)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.white, lineWidth: 2)
                            )
                            .font(.custom("Futura", size: 26))
                            .foregroundColor(.white)
                    }
                }
                .offset(y: 100)
                HStack {
                    VStack {
                        Text("FATS           \(fats, specifier: "%.0f") / \(fatGoal)g")
                            .frame(width: 180, height: 100)
                            .background(purpleColor)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.white, lineWidth: 2)
                            )
                            .font(.custom("Futura", size: 26))
                            .foregroundColor(.white)
                        
                    }
                    VStack {
                        Text("TOTAL       \(total / totalGoal * 100, specifier: "%.0f")%")
                            .frame(width: 180, height: 100)
                            .background(blueColor)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.white, lineWidth: 2)
                            )
                            .font(.custom("Futura", size: 26))
                            .foregroundColor(.white)
                        
                    }
                }
                .offset(y: 210)
            }
            
            HStack{
                NavigationLink(destination: NutritionalDATA(), label: {
                    // go to meal page{
                    Text("ADD MEAL")
                        .font(.custom("Arial Rounded MT Bold", size: 24))
                        .bold()
                        .foregroundColor(blueColor)
                })
                .frame(width: 155, height: 50)
                .background(Color.white)
                .cornerRadius(10)
                .offset(y: 310)
                NavigationLink(destination: WorkoutMaker(), label: {
                    // go to meal page{
                    Text("ADD WORKOUT")
                        .font(.custom("Arial Rounded MT Bold", size: 20))
                        .bold()
                        .foregroundColor(blueColor)
                })
                .frame(width: 155, height: 50)
                .background(Color.white)
                .cornerRadius(10)
                .offset(y: 310)
            }
            
            Text("iLift")
                .font(.custom("Futura", size: 20))
                .foregroundColor(.white)
                .opacity(0.5)
                .offset(y:380)
            
            ZStack {
                VStack {
                    HStack {
                        NavigationLink(destination: Settings(), label:
                                        // go to settings screen
                                       {
                            
                            Image(systemName: "person")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(.white)
                            
                            
                        })
                        
                   
                    } //: VStack
                    
                   Spacer()
                } //: HStack
                
            } //: ZStack -> Settings Navigator
            
        }
        .navigationBarBackButtonHidden(true)
    }
    
    
    struct HomeView_Previews: PreviewProvider{
        static var previews: some View{
            HomeView()
        }
    }
    
}

