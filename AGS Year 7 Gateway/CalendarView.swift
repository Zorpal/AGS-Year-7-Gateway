import SwiftUI

// This has the code to display term dates. You can cahnge the sections as needed, or just change the dates as required. 
struct CalendarView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("TERM DATES 2025-2026")
                        .font(.title)
                        .bold()
                        .padding(.bottom)
                    
                    termSection(
                        title: "Autumn Term 2025",
                        dates: [
                            "4 Sept 2025: Transition Day (Year 7 & 12)",
                            "5 Sept 2025: Term Starts (Years 8-11 & 13)",
                            "23 Oct 2025: Half Term Begins",
                            "4 Nov 2025: Return from Half Term",
                            "17 Dec 2025: Term Ends (1pm)"
                        ]
                    )
                    
                    termSection(
                        title: "Spring Term 2026",
                        dates: [
                            "6 Jan 2026: Term Starts",
                            "13 Feb 2026: Half Term Begins",
                            "23 Feb 2026: Return from Half Term",
                            "27 Mar 2026: Term Ends"
                        ]
                    )
                    
                    termSection(
                        title: "Summer Term 2026",
                        dates: [
                            "13 Apr 2026: Term Starts",
                            "4 May 2026: Bank Holiday",
                            "21 May 2026: Half Term Begins",
                            "1 June 2026: Return from Half Term",
                            "17 July 2026: Term Ends (1pm)"
                        ]
                    )
                    
                    Group {
                        Text("Professional Development Days")
                            .font(.headline)
                            .padding(.top)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("• 2 September 2025")
                            Text("• 3 September 2025")
                            Text("• 5 January 2026")
                            Text("• 22 May 2026")
                        }
                    }
                }
                .padding()
                AGSLogoButton()
            }
            .navigationTitle("Calendar")
        }
    }
    
    private func termSection(title: String, dates: [String]) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
            
            ForEach(dates, id: \.self) { date in
                Text("• \(date)")
            }
        }
    }
}
