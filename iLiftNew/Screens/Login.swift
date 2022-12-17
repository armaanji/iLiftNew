import SwiftUI
import Firebase


struct Login: View {

    @State var email: String = ""
    @State var password: String = ""
    static var loginStatus = "LOGIN FAILURE"
    func login() {
          Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
              if error != nil {
                  print(error?.localizedDescription ?? "")
              } else {
                  print("success")
                  Login.loginStatus = "LOGIN SUCCESS"
                  userID = result!.user.uid
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
                        .padding(.top, 50)
                    Spacer()
                    //  Form
                    VStack(spacing:0){
                        Label {
                            CustomTextfield(placeholder: Text("Email"), fontName: "NunitoSans-Bold", fontSize: 16, fontColor: Color.white, foregroundColor: Color.white, username: $email)
                        } icon: {
                            Image(systemName: "person")
                                .frame(width: 14, height: 14)
                                .padding(.leading)
                        }.frame(height: 45)
                            .overlay(Rectangle().stroke(Color.white, lineWidth: 0.5).frame(height: 45))
                        
                        Label {
                            CustomSecureField(placeholder: Text("Password"), fontName: "NunitoSans-Bold", fontSize: 16, fontColor: Color.white, password: $password)
                        } icon: {
                            Image(systemName: "lock")
                                .frame(width: 14, height: 14)
                                .padding(.leading)
                        }.frame(height: 45)
                            .overlay(Rectangle().stroke(Color.white, lineWidth: 0.5).frame(height: 45))
                        
                    }
                    NavigationLink(destination: ForgotPasswordView(), label:{
                        Text("Forgot Password")
                            .modifier(CustomTextM(fontName: "NunitoSans-Bold", fontSize: 16, fontColor: Color.white))
                        .padding(.bottom,30)})
                    
                    
                    
                    
                    
                    //New method for page switch
                    NavigationLink(destination: HomeView().onAppear()
                    {
                        login()
                       
                    }
                                   , label: {Text("LOGIN")
                        .modifier(CustomTextM(fontName: "NunitoSans-Bold", fontSize: 18, fontColor: Color.black))}).frame(maxWidth:.infinity, maxHeight: 60)
                        .background(Color.white)
                    
                }
                .foregroundColor(.white)
                //.padding(.horizontal,20)
                //.padding(.bottom,60)
                
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
struct CustomTextM: ViewModifier {
    let fontName: String
    let fontSize: CGFloat
    let fontColor: Color
    
    func body(content: Content) -> some View {
        content
            .font(.custom(fontName, size: fontSize))
            .foregroundColor(fontColor)
    }
}
struct SFButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .frame(height: 56, alignment: .leading)
    }
}


