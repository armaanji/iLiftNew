import SwiftUI
import Firebase

struct firstScreen: View {
    
    
    var body: some View {
        NavigationView{
            ZStack{
                //  BG
                Image("calm")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                    Text("      iLIFT      ")
                        .modifier(CustomTextM(fontName: "NunitoSans-Bold", fontSize: 26, fontColor: Color.white))
                        .padding(.bottom,100)
                    
                    
                    
                    NavigationLink(destination: Login(),label: {
                        Text("LOGIN")
                            .modifier(CustomTextM(fontName: "NunitoSans-Bold",fontSize: 18,fontColor: .black))
                           .frame(maxWidth:.infinity, maxHeight: 60)
                           .background(Color.white)
                    })
                    //  Button SignUp
                    NavigationLink(destination: AccountInfo(),label: {
                        Text("SIGN UP")
                            .modifier(CustomTextM(fontName: "NunitoSans-Bold",fontSize: 18,fontColor: .black))
                            .frame(maxWidth:.infinity, maxHeight: 60)
                            .background(Color.white)
                    })
                    
                    
                    
                }
                .foregroundColor(.white)
                
                .padding(.bottom,60)
                
                
            }
        }
    }
    
    
    struct firstScreen_Previews: PreviewProvider {
        static var previews: some View {
            firstScreen()
        }
    }
    
    
}
