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
    @Binding var active: Bool
    let devName = "Trinh Van Minh Duc"
    let studentID = "123456"
    let program = "Software Engineering"
    @State private var isShowingAlert = false
    var body: some View {
        ZStack{
            Image("welcome-background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                .opacity(0.4)
            VStack {
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                Text("Bucket Money")
                    .font(.title)
                    .fontWeight(.bold)
                Text("Know your teams, know your bets")
                    .font(.subheadline)
                    .foregroundColor(.black)
                Spacer()
                Button(action: {
                    active = false
                }, label: {
                    Capsule()
                      .fill(Color.black.opacity(0.9))
                      .padding(10)
                      .frame(width:250, height:80)
                      .overlay(Text("Team List")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white))
                })
                Button(action: {
                    isShowingAlert = true
                }) {
                    Image(systemName: "info.circle")
                        .font(.title)
                        .foregroundColor(.black)
                }
                .alert(isPresented: $isShowingAlert) {
                    Alert(title: Text("Developer Info"),
                          message: Text("Developer: \(devName)\nStudent ID: \(studentID)\nProgram: \(program)"),
                          dismissButton: .default(Text("OK")));
                }
            }
        }
    }
}

    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
    }



struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView(active: .constant(true))
    }
}
