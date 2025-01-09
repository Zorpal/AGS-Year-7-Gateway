
import SwiftUI

struct FAQView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Text("Frequently Asked Questions")
                        .font(.largeTitle)
                        .padding()
                        .multilineTextAlignment(.center)
                    NavigationLink(destination: Q1View()) {
                        Text("What is this app for?")
                            .padding(.horizontal)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.blue)
                    }
                    Spacer()
                    NavigationLink(destination: Q2View()) {
                        Text("I find this school very intimidating to navigate. How do I find my way around?")
                            .padding(.horizontal)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.blue)
                    }

                }
                AGSLogoButton()
                .navigationTitle("FAQ")
                .padding()
            }
            Spacer()

        }
    }
}

struct Q1View: View {
    var body: some View {
        Text("What is this app for?")
            .font(.largeTitle)
            .multilineTextAlignment(.center)
            .frame(maxWidth: 300, alignment: .center)
            .padding(.top, 20)
        Spacer()
        Text("This app was made to help upcoming Year 7's like yourselves, to obtain more information to be more comfortable with AGS School life and the opportunities you have access to.")
            .padding(.horizontal)
            .multilineTextAlignment(.center)
        Spacer()
    }
}
struct Q2View: View {
    var body: some View {
        VStack {
            Text("I find this school very intimidating to navigate. How do I find my way around?")
                .font(.largeTitle)
                .frame(maxWidth: 300, alignment: .center)
                .multilineTextAlignment(.center)
                .padding(.top, 20)
            Spacer()
            Text("We have a handy map of the school on our dedicated app, please navigate to the main page and click on the 'Map' button.")
                .padding(.horizontal)
                .multilineTextAlignment(.center)
            Spacer()
            
        }
    }
}
