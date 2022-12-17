import Firebase
import FirebaseFirestore
import SwiftUI


struct FirebaseDocumentView: View {
    
    @State var data: [String:Any] = [:]
    @State var arrayData = []
    
    var body: some View {


        VStack {
            Button(action: {
                let db = Firestore.firestore()
                db.collection("users").document("awCQCAWK61UIHs888dXfxO81Uir1").getDocument { (document, error) in
                    if let document = document, document.exists {
                        self.data = document.data()!
                        dump(self.data)
                        /**
                         for (key, value) in self.data {
                         print("\(key): \(value)")
                         }
                         */
                    } else {
                        print("Document does not exist")
                    }
                }
            }) {
                Text("Load Data")
            }
            List(data.keys.sorted(), id: \.self) { key in
                if let value = self.data[key] as? String {
                    Text("\(key): \(value)")
                    
                    
                } else {
                    Text("\(key): Unavailable")
                }
            }
            
        }
    }
}




struct FirebaseDocumentView_Previews: PreviewProvider {
    static var previews: some View {
        FirebaseDocumentView()
    }
}

