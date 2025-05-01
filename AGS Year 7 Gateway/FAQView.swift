import SwiftUI
import WebKit

// This contains the code for the FAQ page of the app. To add more FAQs, just copy paste the FAQItem struct and change the question and answer text.
struct FAQView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Frequently Asked Questions")
                        .font(.largeTitle)
                        .padding(.bottom, 20)
                        .multilineTextAlignment(.center)

                    FAQItem(question: "What is this app for?",
                            answer: "This app was made to help upcoming Year 7's like yourselves, to obtain more information to be more comfortable with AGS School life and the opportunities you have access to.")

                    FAQItem(question: "I find this school very intimidating to navigate. How do I find my way around?",
                            answer: "We have a handy map of the school on our dedicated app, please navigate to the main page and click on the 'Map' button.")

                    FAQItem(question: "Where is the school located?",
                            answer: "The school is located at 123 AGS Street, in the heart of the city. You can find detailed directions on the app's 'Location' section.")

                    FAQItem(question: "What is the house system?",
                            answer: "The house system is a way to foster community and friendly competition. Each student is assigned to one of four houses, and you can earn points for your house through various activities.")

                    VStack(alignment: .leading, spacing: 10) {
                        Text("What extracurricular activities are available?")
                            .font(.title2)
                            .bold()
                            .padding(.bottom, 5)

                        Text("AGS offers a variety of extracurricular activities, including sports, music, drama, and academic clubs. Check the link below for more details.")
                            .font(.body)

                        NavigationLink(destination: WebView(url: URL(string: "https://issuu.com/aylesburygrammar/docs/final_clubs_and_soc_pdf_24-25?fr=sMzY4YjYzODA2NTQ")!)) {
                            Text("View Extracurricular Activities")
                                .foregroundColor(.blue)
                                .underline()
                        }
                    }

                    FAQItem(question: "How do I contact my teachers?",
                            answer: "You can contact your teachers through google classroom or by emailing them directly. Their contact information is available on the school website.")
                }
                .padding()
            }
            .navigationTitle("FAQ")
        }
    }
}

struct WebView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}

struct FAQItem: View {
    let question: String
    let answer: String

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(question)
                .font(.title2)
                .bold()
                .padding(.bottom, 5)

            Text(answer)
                .font(.body)
        }
    }
}
