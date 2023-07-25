/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2023B
 Assessment: Assignment 1
 Author: Trinh Van Minh Duc
 ID: s3915177
 Created  date: 25/07/2023
 Last modified:
 Acknowledgement: Acknowledge the resources that you use here.
*/


import SwiftUI

struct WelcomeView: View {
    // Replace with your actual app author information
    let authorName = "Trinh Van Minh Duc"
    let studentID = "123456"
    let program = "Computer Science"

    var body: some View {
        ZStack {
            Image("welcome-background")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .edgesIgnoringSafeArea(.all)
            VStack {
                // Logo image
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                
                // App name and slogan
                Text("NBA Info")
                    .font(.title)
                    .fontWeight(.bold)
                Text("Know your teams, know your bets")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Spacer()
                // Button to navigate to the navigation list view
                NavigationLink(destination: ListView()) {
                    Text("Team List")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
                
                
                // Info icon button to display the app author information
                Button(action: {
                    // Show the pop-up view with the app author information here
                    // You can use a custom sheet or popover to display the information.
                    // For simplicity, I'll show an alert as a pop-up in this example.
                    let authorInfo = "Author: \(authorName)\nStudent ID: \(studentID)\nProgram: \(program)"
                    showAlert(title: "App Author", message: authorInfo)
                }) {
                    Image(systemName: "info.circle")
                        .font(.title)
                }
                .padding()
            }
        }
    }

    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
    }
}


struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
