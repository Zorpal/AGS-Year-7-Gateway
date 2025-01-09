import SwiftUI
import WebKit

struct SchoolLifeView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("School Rules")
                    .font(.largeTitle)
                    .padding()
                
                Spacer()
                
                AGSLogoButton()
            }
        }
        .background(Color(hex: "#6b162c"))
        .navigationTitle("School Life")
    }
}
                                                
