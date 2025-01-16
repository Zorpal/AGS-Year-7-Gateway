import SwiftUI

struct RulesView: View {
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    VStack {
                        Text("School Rules")
                            .font(.largeTitle)
                            .padding()
                            .multilineTextAlignment(.center)
                        Text("What is this app for?")
                            .padding(.horizontal)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.blue)
                        Spacer()
                        Text("I find this school very intimidating to navigate. How do I find my way around?")
                            .padding(.horizontal)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.blue)
                        
                    }
                    AGSLogoButton()
                        .navigationTitle("Rules")
                        .padding()
                }
                Spacer()
                
            }
        }
    }
}

#Preview {
    RulesView()
}
