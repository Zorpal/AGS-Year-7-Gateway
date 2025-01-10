import SwiftUI
import Combine
import Foundation
struct CalendarView: View {
    @StateObject private var viewModel = TermDatesViewModel()
    
    var body: some View {
        VStack {
            if let termDates = viewModel.termDates {
                List {
                    Section(header: Text("Autumn Term 2024")) {
                        if let transitionDay = termDates.autumnTerm2024.transitionDayYear712 {
                            Text("Transition Day (Year 7 & 12): \(formatDate(transitionDay))")
                        }
                        if let termStarts = termDates.autumnTerm2024.termStartsYears81113 {
                            Text("Term Starts (Years 8, 11, 13): \(formatDate(termStarts))")
                        }
                        Text("Half Term Close: \(formatDate(termDates.autumnTerm2024.halfTerm.close))")
                        Text("Half Term Open: \(formatDate(termDates.autumnTerm2024.halfTerm.open))")
                        Text("Term Ends: \(formatDate(termDates.autumnTerm2024.termEnds))")
                    }
                    
                    Section(header: Text("Spring Term 2025")) {
                        if let termStarts = termDates.springTerm2025.termStarts {
                            Text("Term Starts: \(formatDate(termStarts))")
                        }
                        Text("Half Term Close: \(formatDate(termDates.springTerm2025.halfTerm.close))")
                        Text("Half Term Open: \(formatDate(termDates.springTerm2025.halfTerm.open))")
                        Text("Term Ends: \(formatDate(termDates.springTerm2025.termEnds))")
                    }
                    
                    Section(header: Text("Summer Term 2025")) {
                        if let termStarts = termDates.summerTerm2025.termStarts {
                            Text("Term Starts: \(formatDate(termStarts))")
                        }
                        Text("Half Term Close: \(formatDate(termDates.summerTerm2025.halfTerm.close))")
                        Text("Half Term Open: \(formatDate(termDates.summerTerm2025.halfTerm.open))")
                        Text("Term Ends: \(formatDate(termDates.summerTerm2025.termEnds))")
                    }
                    
                    Section(header: Text("Bank Holidays")) {
                        Text("Early May Bank Holiday: \(formatDate(termDates.bankHolidays.earlyMayBankHoliday))")
                    }
                    
                    Section(header: Text("Professional Development Days")) {
                        ForEach(termDates.professionalDevelopmentDays, id: \.self) { day in
                            Text(formatDate(day))
                        }
                    }
                }
            } else {
                Text("Loading...")
            }
        }
        .onAppear {
            viewModel.fetchData(urlString: "https://det.kevcyg.net/")
        }
        .navigationTitle("School Calendar")
    }
    
    private func formatDate(_ dateString: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        guard let date = formatter.date(from: dateString) else { return dateString }
        
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}


struct TermDatesResponse: Codable {
    let termDates: TermDates
    
    enum CodingKeys: String, CodingKey {
        case termDates = "term_dates"
    }
}

struct TermDates: Codable {
    let autumnTerm2024: Term
    let springTerm2025: Term
    let summerTerm2025: Term
    let bankHolidays: BankHolidays
    let professionalDevelopmentDays: [String]
    
    enum CodingKeys: String, CodingKey {
        case autumnTerm2024 = "autumn_term_2024"
        case springTerm2025 = "spring_term_2025"
        case summerTerm2025 = "summer_term_2025"
        case bankHolidays = "bank_holidays"
        case professionalDevelopmentDays = "professional_development_days"
    }
}

struct Term: Codable {
    let transitionDayYear712: String?
    let termStartsYears81113: String?
    let termStarts: String?
    let halfTerm: HalfTerm
    let termEnds: String
    
    enum CodingKeys: String, CodingKey {
        case transitionDayYear712 = "transition_day_year_7_12"
        case termStartsYears81113 = "term_starts_years_8_11_13"
        case termStarts = "term_starts"
        case halfTerm = "half_term"
        case termEnds = "term_ends"
    }
}

struct HalfTerm: Codable {
    let close: String
    let open: String
}

struct BankHolidays: Codable {
    let earlyMayBankHoliday: String
    
    enum CodingKeys: String, CodingKey {
        case earlyMayBankHoliday = "early_may_bank_holiday"
    }
}

class TermDatesViewModel: ObservableObject {
    @Published var termDates: TermDates?
    
    func fetchData(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data found")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(TermDatesResponse.self, from: data)
                
                DispatchQueue.main.async {
                    self.termDates = jsonData.termDates
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }
}
