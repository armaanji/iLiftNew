

import Firebase
import SwiftUI



struct HomePage: View {
    
    func getUserData() {
        let db = Firestore.firestore()
        
        let docRef = db.collection("users").document(userID)
        
        docRef.getDocument{(document,error) in
            if let document = document, document.exists {
                let dataDescription = document.data().map(String.init(describing:)) ?? nil
                print("User data: \(dataDescription)")
            }
                print("User doesn't exist")
        }
    }
 
    var body: some View {
        
        ZStack{
            //  BG
            Image("calm")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Welcome")
                }
            }
        }
    }

struct HomePage_Previews: PreviewProvider{
    static var previews: some View{
        HomePage()
    }
}

