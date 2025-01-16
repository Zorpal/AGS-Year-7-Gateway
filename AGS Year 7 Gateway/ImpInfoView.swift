import SwiftUI
import PDFKit

struct ImpInfoView: View {
    var body: some View {
        VStack {
            NavigationLink(destination: PDFKitView(named: "Year7WelcomeBooklet")) {
                Text("Welcome Booklet")
                    .font(.headline)
                    .frame(width: 200)
                    .padding()
                    .background(Color.purple)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }

            Spacer().frame(height: 20)

            Button(action: {
                openPDFLink()
            }) {
                Text("Download Welcome Booklet")
                    .font(.headline)
                    .frame(width: 200)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .navigationTitle("Important Information")
        .navigationBarTitleDisplayMode(.inline)
    }

    func openPDFLink() {
        if let url = URL(string: "https://www.ags.bucks.sch.uk/wp-content/uploads/2020/06/Student-Welcome-Booklet-2020-2021.pdf") {
            UIApplication.shared.open(url)
        }
    }
}

struct PDFKitView: UIViewRepresentable {
    let pdfDocument: PDFDocument

    init?(named name: String) {
        guard let url = Bundle.main.url(forResource: name, withExtension: "pdf") else {
            return nil
        }
        guard let document = PDFDocument(url: url) else {
            return nil
        }
        self.pdfDocument = document
    }

    func makeUIView(context: Context) -> PDFView {
        let pdfView = PDFView()
        pdfView.document = pdfDocument
        pdfView.autoScales = true
        return pdfView
    }

    func updateUIView(_ uiView: PDFView, context: Context) {
        //...
    }
}
