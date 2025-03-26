import SwiftUI
import WebKit

struct O365CalendarView: View {
    var body: some View {
        NavigationView {
            VStack {
                SafeCalendarWebView(url: URL(string: "https://outlook.office365.com/calendar/published/850c9ee05c404378bbd7cd5734fabae8@ags.bucks.sch.uk/cf2acea7e7064555a5e107dc2a9af0a34337028718916759363/calendar.html")!)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)

                AGSLogoButton()
            }
            .navigationTitle("Live Calendar")
        }
        .navigationViewStyle(.stack)
    }
}

struct SafeCalendarWebView: UIViewRepresentable {
    let url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        let config = WKWebViewConfiguration()
        config.defaultWebpagePreferences.allowsContentJavaScript = true
        
        let webView = WKWebView(frame: .zero, configuration: config)
        webView.allowsBackForwardNavigationGestures = true
        webView.scrollView.isScrollEnabled = true
        
        let request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad)
        webView.load(request)
        
        return webView
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        // No update needed
    }
}
