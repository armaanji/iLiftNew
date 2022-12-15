import SwiftUI

struct SplitMaker: View {
    
    // Define an array of common workouts to display in the picker
    let workouts = ["Bar Dip",
                    "Bench Press",
                    "Cable Chest Press",
                    "Close-Grip Bench Press",
                    "Close-Grip Feet-Up Bench Press",
                    "Decline Bench Press",
                    "Dumbbell Chest Fly",
                    "Dumbbell Chest Press",
                    "Dumbbell Floor Press",
                    "Dumbbell Pullover",
                    "Feet-Up Bench Press",
                    "Floor Press",
                    "Incline Bench Press",
                    "Incline Dumbbell Press",
                    "Incline Push-Up",
                    "Kneeling Incline Push-Up",
                    "Kneeling Push-Up",
                    "Machine Chest Fly",
                    "Machine Chest Press",
                    "Pec Deck",
                    "Push-Up",
                    "Push-Up Against Wall",
                    "Resistance Band Chest Fly",
                    "Smith Machine Bench Press",
                    "Smith Machine Incline Bench Press",
                    "Standing Cable Chest Fly",
                    "Band External Shoulder Rotation",
                    "Band Internal Shoulder Rotation",
                    "Band Pull-Apart",
                    "Barbell Front Raise",
                    "Barbell Rear Delt Row",
                    "Barbell Upright Row",
                    "Behind the Neck Press",
                    "Cable Lateral Raise",
                    "Cable Rear Delt Row",
                    "Dumbbell Front Raise",
                    "Dumbbell Horizontal Internal Shoulder Rotation",
                    "Dumbbell Horizontal External Shoulder Rotation",
                    "Dumbbell Lateral Raise",
                    "Dumbbell Rear Delt Row",
                    "Dumbbell Shoulder Press",
                    "Face Pull",
                    "Lying Dumbbell External Shoulder Rotation",
                    "Lying Dumbbell Internal Shoulder Rotation",
                    "Machine Lateral Raise",
                    "Machine Shoulder Press",
                    "Monkey Row",
                    "Overhead Press",
                    "Power Jerk",
                    "Push Press",
                    "Reverse Dumbbell Flyes",
                    "Reverse Machine Fly",
                    "Seated Dumbbell Shoulder Press",
                    "Seated Barbell Overhead Press",
                    "Seated Smith Machine Shoulder Press",
                    "Snatch Grip Behind the Neck Press",
                    "Squat Jerk",
                    "Split Jerk",
                    "Barbell Curl",
                    "Barbell Preacher Curl",
                    "Cable Curl With Bar",
                    "Cable Curl With Rope",
                    "Concentration Curl",
                    "Dumbbell Curl",
                    "Dumbbell Preacher Curl",
                    "Hammer Curl",
                    "Incline Dumbbell Curl",
                    "Spider Curl",
                    "Barbell Standing Triceps Extension",
                    "Barbell Lying Triceps Extension",
                    "Bench Dip",
                    "Close-Grip Push-Up",
                    "Dumbbell Lying Triceps Extension",
                    "Dumbbell Standing Triceps Extension",
                    "Overhead Cable Triceps Extension",
                    "Tricep Pushdown With Bar",
                    "Tricep Pushdown With Rope",
                    "Air Squat",
                    "Barbell Hack Squat",
                    "Barbell Lunge",
                    "Body Weight Lunge",
                    "Box Squat",
                    "Bulgarian Split Squat",
                    "Chair Squat",
                    "Dumbbell Lunge",
                    "Dumbbell Squat",
                    "Front Squat",
                    "Goblet Squat",
                    "Hack Squat Machine",
                    "Half Air Squat",
                    "Hip Adduction Machine",
                    "Landmine Hack Squat",
                    "Landmine Squat",
                    "Leg Extension",
                    "Leg Press",
                    "Lying Leg Curl",
                    "Pause Squat",
                    "Safety Bar Squat",
                    "Seated Leg Curl",
                    "Shallow Body Weight Lunge",
                    "Side Lunges (Bodyweight)",
                    "Smith Machine Squat",
                    "Squat",
                    "Step Up",
                    "Back Extension",
                    "Barbell Row",
                    "Barbell Shrug",
                    "Block Snatch",
                    "Cable Close Grip Seated Row",
                    "Cable Wide Grip Seated Row",
                    "Chin-Up",
                    "Clean",
                    "Clean and Jerk",
                    "Deadlift",
                    "Deficit Deadlift",
                    "Dumbbell Deadlift",
                    "Dumbbell Romanian Deadlift",
                    "Dumbbell Row",
                    "Dumbbell Shrug",
                    "Floor Back Extension",
                    "Good Morning",
                    "Hang Clean",
                    "Hang Power Clean",
                    "Hang Power Snatch",
                    "Hang Snatch",
                    "Inverted Row",
                    "Inverted Row with Underhand Grip",
                    "Kettlebell Swing",
                    "Lat Pulldown With Pronated Grip",
                    "Lat Pulldown With Supinated Grip",
                    "One-Handed Cable Row",
                    "One-Handed Lat Pulldown",
                    "Pause Deadlift",
                    "Pendlay Row",
                    "Power Clean",
                    "Power Snatch",
                    "Pull-Up",
                    "Rack Pull",
                    "Romanian Deadlift",
                    "Seal Row",
                    "Seated Machine Row",
                    "Snatch",
                    "Snatch Grip Deadlift",
                    "Stiff-Legged Deadlift",
                    "Straight Arm Lat Pulldown",
                    "Sumo Deadlift",
                    "T-Bar Row",
                    "Trap Bar Deadlift With High Handles",
                    "Trap Bar Deadlift With Low Handles",
                    "Banded Side Kicks",
                    "Cable Pull Through",
                    "Clamshells",
                    "Fire Hydrants",
                    "Glute Bridge",
                    "Hip Abduction Against Band",
                    "Hip Abduction Machine",
                    "Hip Thrust",
                    "Hip Thrust Machine",
                    "Hip Thrust With Band Around Knees",
                    "Lateral Walk With Band",
                    "One-Legged Glute Bridge",
                    "One-Legged Hip Thrust",
                    "Step Up",
                    "Cable Crunch",
                    "Crunch",
                    "Hanging Leg Raise",
                    "Hanging Knee Raise",
                    "Hanging Sit-Up",
                    "High to Low Wood Chop with Band",
                    "Horizontal Wood Chop with Band",
                    "Kneeling Ab Wheel Roll-Out",
                    "Kneeling Plank",
                    "Kneeling Side Plank",
                    "Lying Leg Raise",
                    "Lying Windshield Wiper",
                    "Lying Windshield Wiper with Bent Knees",
                    "Machine Crunch",
                    "Oblique Crunch",
                    "Oblique Sit-Up",
                    "Plank",
                    "Side Plank",
                    "Sit-Up",
                    "Eccentric Heel Drop",
                    "Heel Raise",
                    "Seated Calf Raise",
                    "Standing Calf Raise",
                    "Barbell Wrist Curl",
                    "Barbell Wrist Curl Behind the Back",
                    "Bar Hang",
                    "Dumbbell Wrist Curl",
                    "Farmers Walk",
                    "Fat Bar Deadlift",
                    "Gripper",
                    "One-Handed Bar Hang",
                    "Plate Pinch",
                    "Plate Wrist Curl",
                    "Towel Pull-Up",
                    "Barbell Wrist Extension",
                    "Dumbbell Wrist Extension",].sorted()

    @State private var searchQuery = ""
    @State private var pickerExpanded: Bool = false
    // Create a list of workout splits
    @State private var splits = [WorkoutSplit]()

    // The current selected workout
    @State private var selectedWorkout = 0

    // The current split label
    @State private var splitLabel = ""

    // The current selected split
    @State private var selectedSplit = WorkoutSplit(label: "", workouts: [])
    @State var selectedNumSets = 0
    @State var selectedNumReps = 0
    @State var arrayOfRepsAndSets = [""]
    @State var numSets = [1,2,3,4,5]
    @State var numReps = ["1-2","3-5","5-8","8-10","10-12"]
    @State var indexCounter = 0
    
    @State private var splitIsSelected = true

    var body: some View {
        NavigationView {
            Form {
                // Use a text field to allow the user to enter a label for the workout split
                TextField("Enter a label for the split...", text: $splitLabel)
                        .background(Color.white)
                        .cornerRadius(8)
                
                // Use a button to create a new split with the label and workouts
                Button(action: {
                    let split = WorkoutSplit(label: self.splitLabel, workouts: [])
                    self.splits.append(split)
                    
                    // Clear the current split and label
                    self.selectedSplit = WorkoutSplit(label: "", workouts: [])
                    self.splitLabel = ""
                }) {
                    Text("Create Split")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }.offset(x: 91)
                
                // Use a list to display the created splits
                Section(header: Text("Created Splits:")) {
                    ForEach(splits, id: \.label) { split in
                        // Add a button to each split in the list to allow the user to edit it
                        Button(action: {
                            splitIsSelected = true
                            self.selectedSplit = split
                            self.splitLabel = split.label
                        }) {
                            VStack(alignment: .leading) {
                                Text(split.label)
                                    .font(.headline)
                                
                                // Use a nested ForEach loop to display the workouts in the split
                                ForEach(split.workouts, id: \.self) { workout in
                                    Text("\(workout) (\(arrayOfRepsAndSets[indexCounter]))")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                                
                            }
                        }
                    }
                }
            

                if !selectedSplit.label.isEmpty && splitIsSelected {
                    // Use a picker to allow the user to select a workout
                    Picker(selection: $selectedWorkout, label: Text("Select a Exercise \n To Add To \(splitLabel)")) {
                        ForEach(workouts.indices) { index in
                            // Use the search query to filter the workouts
                            if searchQuery.isEmpty || workouts[index].lowercased().contains(searchQuery.lowercased()) {
                                Text(self.workouts[index])
                                    .tag(index)
                                
                                
                            }
                        }
                    }.frame(width: .infinity, height: 75).offset(y:10).overlay(
                        // Add a TextField to allow the user to input a search query
                        HStack {
                            Image(systemName: "magnifyingglass")

                            TextField("Search workouts", text: $searchQuery)

                            if !searchQuery.isEmpty {
                                
                                Button(action: {
                                    self.searchQuery = ""
                                }) {
                                    Image(systemName: "xmark.circle.fill")
                                    
                                }
                            }
                        }
                            .offset(x:165).offset(y:-35)
                    )

                    
                    // Use a button to confirm the selected workout and add it to the current workout split
                    Group{
                        Picker(selection: $selectedNumSets, label: Text("Select How Many Sets Of \(workouts[selectedWorkout])s")){
                            ForEach(numSets.indices) { index in
                                Text("\(self.numSets[index])")
                                    .tag(index)
                                
                                
                            }
                            
                        }
                        Picker(selection: $selectedNumReps, label: Text("Select How Many Reps Per Set")){
                            ForEach(numReps.indices) { index in
                                
                                Text("\(self.numReps[index])")
                                    .tag(index)
                                
                                
                            }
                        }
                    }
                    Button(action: {
                        self.selectedSplit.workouts.append(self.workouts[self.selectedWorkout])
                        self.arrayOfRepsAndSets.append("Sets: \(numSets[selectedNumSets]) Reps: \(numReps[selectedNumReps])")
                        indexCounter += 1
                        // Update the list of splits with the updated split
                        if let index = self.splits.firstIndex(where: { $0.label == self.selectedSplit.label }) {
                            self.splits[index] = self.selectedSplit
                        
                        }
                    }) {
                        Text("Add Execise").offset(x:110)
                    }
                    Button(action: {
                                    // Close out the form here
                                    self.splitIsSelected = false
                                }) {
                                    Text("Done").offset(x:140)
                                }
                    Button(action: {
                                    // Close out the form here
                     //MAKE IT SO THAT WHEN A SPLIT IS DELETED, THE INDECIES ASSOCIATED WITH THE DELETED WORKOUTS AND REPS/SETS ALSO GETS DELETED   arrayOfRepsAndSets = arrayOfRepsAndSets.removeSubrange(<#T##Range<Self.Index>#>)
                        splits = splits.filter { $0 != selectedSplit }
                        self.splitIsSelected = false
                                }) {
                                    Text("Remove Split").offset(x:110).font(.headline)
                                        .foregroundColor(.red)
                                }
                }
            }
        }
    }
}

private struct WorkoutSplit: Hashable {
    let label: String
    var workouts: [String]
}



struct SplitMaker_Previews: PreviewProvider {
    static var previews: some View {
        SplitMaker()
    }
}
