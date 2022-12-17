//
//  NutritionalDATA.swift
//  iLiftNew
//
//  Created by Ben Korengold on 1/10/23.

import SwiftUI

struct NutritionalDATA: View {
    
    @State private var nutritionData: NutritionalData?
    @State private var searchText: String = ""
    @State private var foodResults: [Food] = []
    @State private var selectedFoodIndex: Int?
    @State private var isDataDisplayed: Bool = false
    
    
    var body: some View {
            Form {
                Section {
                    TextField("Search for food", text: $searchText)
                    Button(action: { self.loadFoodResults(); self.selectedFoodIndex = nil }) {
                        Text("Search")
                    }
                }
                if foodResults.count > 0 && self.selectedFood == nil{
                        ScrollView {
                            ForEach(foodResults.enumerated().map { IdentifiableFood(id: $0, food: $1) } ) { item in
                                HStack {
                                    Spacer()
                                    Button(action: {
                                        self.selectedFoodIndex = item.id
                                        self.isDataDisplayed = true
                                    }) {
                                        HStack {
                                            Text(item.food.description)
                                            if self.selectedFoodIndex == item.id {
                                                Image(systemName: "checkmark")
                                            }
                                        }
                                    }
                                    .padding()
                                    .background(Color.clear)
                                    .foregroundColor(.black)
                                    .cornerRadius(8)
                                    Spacer()
                                }
                                .padding(.vertical,10)
                                .background(self.selectedFoodIndex == item.id ? Color.blue : Color.white)
                            }
                        }
                    
                }
                
                
                
                
                if let selectedFood = selectedFood {
                    if (isDataDisplayed == true){
                        if let nutritionalData = selectedFood.nutritionalData {
                            Section {
                                Text("Selected Food: \(selectedFood.description)")
                                Text("Calories: \(Int((nutritionalData.calories).rounded()))cal")
                                Text("Protein: \(Int((nutritionalData.protein).rounded()))g")
                                Text("Carbs: \(Int((nutritionalData.carbs).rounded()))g")
                                Text("Fat: \(Int((nutritionalData.fat).rounded()))g")
                                Text("Serving Size: \(nutritionalData.servingSize)")
                                
                            }
                        } else {
                            Text("No Nutritional data available")
                        }
                    }
                } else if foodResults.count == 0 {
                    Text("Loading food results...")
                }
                
            }
        }
    
        var selectedFood: Food? {
            if selectedFoodIndex != nil {
                return foodResults[selectedFoodIndex!]
            } else {
                return nil
            }
        }
    
    private func loadFoodResults() {
        let url = URL(string: "https://api.nal.usda.gov/fdc/v1/search")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("CqI1Sw0ZfNuG670U96Qqfcc2lARd4CsWkIQAh8fE", forHTTPHeaderField: "X-API-KEY")

        let params: [String: String] = ["query": searchText, "requireAllWords": "true"]

        let queryItems = params.map { URLQueryItem(name: $0, value: $1) }
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        components.queryItems = queryItems

        request.url = components.url

        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                let json = try? JSONSerialization.jsonObject(with: data, options: [])
                if let json = json as? [String: Any] {
                    let foods = json["foods"] as! [[String: Any]]
                    // filter out options that have all of the nutritional data as 0
                    let foodResults = foods.map { Food(json: $0) }.filter { food in
                        if let nutritionalData = food.nutritionalData {
                            return nutritionalData.calories > 0 || nutritionalData.protein > 0 || nutritionalData.carbs > 0 || nutritionalData.fat > 0
                        } else {
                            return false
                        }
                    }
                    
                        DispatchQueue.main.async {
                            self.foodResults = foodResults
                        }
                    }
                }
            }.resume()
        }
}
// API: https://app.swaggerhub.com/apis/fdcnal/food-data_central_api/1.0.1#/FDC/getFood

struct IdentifiableFood: Identifiable {
    var id: Int
    var food: Food
}


struct Food  {
    let fdcId: Int
    let description: String
    let nutritionalData : NutritionalData?
    let servingSize : String?

    init(json: [String: Any]) {
        self.fdcId = json["fdcId"] as! Int
        self.description = json["description"] as! String
        if let portions = json["foodPortions"] as? [[String: Any]], let portion = portions.first {
            self.servingSize = portion["portionDescription"] as? String
        } else {
            self.servingSize = nil
        }
        if let nutrients = json["foodNutrients"] as? [[String: Any]] {
            self.nutritionalData = NutritionalData(json: nutrients)
        } else {
            self.nutritionalData = nil
        }
    }
}




struct NutritionalData {
    let calories: Double
    let protein: Double
    let carbs: Double
    let fat: Double
    let servingSize: String

    init(json: [[String: Any]]) {
        var calories: Double?
        var protein: Double?
        var carbs: Double?
        var fat: Double?
        var servingSize: String?

        for nutrient in json {
            if nutrient["nutrientId"] as? Int == 1008 {
                calories = nutrient["value"] as? Double
            } else if nutrient["nutrientId"] as? Int == 1003 {
                protein = nutrient["value"] as? Double
            } else if nutrient["nutrientId"] as? Int == 1004 {
                carbs = nutrient["value"] as? Double
            } else if nutrient["nutrientId"] as? Int == 1005 {
                fat = nutrient["value"] as? Double
            } else if nutrient["nutrientName"] as? String == "serving size" {
                servingSize = nutrient["value"] as? String
            }
            

            
        }

        self.calories = calories ?? 0.0
        self.protein = protein ?? 0.0
        self.carbs = carbs ?? 0.0
        self.fat = fat ?? 0.0
        self.servingSize = servingSize ?? ""
    }
}







struct NutritionalDATA_Previews: PreviewProvider {
    static var previews: some View {
        NutritionalDATA()
    }
}
