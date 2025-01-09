import SwiftUI
import EventKit

class CalendarManager: ObservableObject {
    let eventStore = EKEventStore()

    func requestAccess(completion: @escaping (Bool, Error?) -> Void) {
        if #available(iOS 17.0, *) {
            eventStore.requestFullAccessToEvents { granted, error in
                DispatchQueue.main.async {
                    completion(granted, error)
                }
            }
        } else {
            // Handle earlier iOS versions
            eventStore.requestAccess(to: .event) { granted, error in
                DispatchQueue.main.async {
                    completion(granted, error)
                }
            }
        }
    }

    func addEvent(title: String, startDate: Date, endDate: Date, completion: @escaping (Bool) -> Void) {
        let event = EKEvent(eventStore: eventStore)
        event.title = title
        event.startDate = startDate
        event.endDate = endDate
        event.calendar = eventStore.defaultCalendarForNewEvents

        do {
            try eventStore.save(event, span: .thisEvent)
            completion(true)
        } catch {
            print("Error saving event: \(error)")
            completion(false)
        }
    }
}

struct TermDate: Identifiable {
    let id = UUID()
    let title: String
    let startDate: Date
    let endDate: Date
}

struct CalendarView: View {
    @StateObject private var calendarManager = CalendarManager()
    @State private var addedEvents = Set<UUID>()
    @State private var showSuccessMessage = false
    
    private let termDates = [
        TermDate(title: "Autumn 1st Term", startDate: dateFromString("2025-09-04"), endDate: dateFromString("2025-10-23")),
        TermDate(title: "Autumn 2nd Term", startDate: dateFromString("2025-11-04"), endDate: dateFromString("2025-12-17")),
        TermDate(title: "Spring 1st Term", startDate: dateFromString("2026-01-06"), endDate: dateFromString("2026-02-13")),
        TermDate(title: "Spring 2nd Term", startDate: dateFromString("2026-02-23"), endDate: dateFromString("2026-03-27")),
        TermDate(title: "Summer 1st Term", startDate: dateFromString("2026-04-13"), endDate: dateFromString("2026-05-21")),
        TermDate(title: "Summer 2nd Term", startDate: dateFromString("2026-06-01"), endDate: dateFromString("2026-07-17"))
    ]
    
    var body: some View {
        VStack {
            if showSuccessMessage {
                Text("Event added successfully!")
                    .foregroundColor(.green)
                    .padding()
            }
            List(termDates) { term in
                VStack(alignment: .leading) {
                    Text(term.title)
                        .font(.headline)
                    Text("Start: \(term.startDate, formatter: dateFormatter)")
                    Text("End: \(term.endDate, formatter: dateFormatter)")
                    if !addedEvents.contains(term.id) {
                        Button("Add to Calendar") {
                            addTermToCalendar(term)
                        }
                    }
                }
                .padding(.vertical)
            }
        }
        .navigationTitle("School Calendar")
    }
    
    private func addTermToCalendar(_ term: TermDate) {
        calendarManager.requestAccess { (granted, error) in
            if granted {
                calendarManager.addEvent(title: term.title, startDate: term.startDate, endDate: term.endDate) { success in
                    if success {
                        addedEvents.insert(term.id)
                        showSuccessMessage = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            showSuccessMessage = false
                        }
                    }
                }
            } else {
                print("Calendar access denied or error: \(String(describing: error))")
            }
        }
    }
    
    private static func dateFromString(_ dateString: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.date(from: dateString) ?? Date()
    }
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            CalendarView()
        }
    }
}
