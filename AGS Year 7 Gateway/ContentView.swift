import SwiftUI
import MapKit
import PDFKit

struct HomePage: View {
    @State private var showFAQ = false
    @State private var coordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 51.81399886621721, longitude: -0.8014580549252044),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    @State private var showRulesPage = false
    @State private var showAGSmap = false
    @State private var showPDF = false

    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(Color(hex: "#802841"))
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }

    var body: some View {
        NavigationView {
            VStack {
                BannerView()

                Spacer()

                NavigationLink(destination: HousesView()) {
                    Text("AGS Houses")
                        .font(.headline)
                        .frame(width: 200)
                        .padding()
                        .background(
                            HStack(spacing: 0) {
                                Color.cyan
                                Color.green
                                Color.yellow
                                Color.purple
                                Color.red
                                Color.blue
                            }
                        )
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

                Spacer()

                NavigationLink(destination: CalendarView()) {
                    Text("Term Dates")
                        .font(.headline)
                        .frame(width: 200)
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                

                Spacer()
                NavigationLink(destination: O365CalendarView()) {
                    Text("School Calendar")
                        .font(.headline)
                        .frame(width: 200)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

                Spacer()

                NavigationLink(destination: RulesView()) {
                    Text("Rules")
                        .font(.headline)
                        .frame(width: 200)
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

                Spacer()

                NavigationLink(destination: AGSLocation(), isActive: $showAGSmap) {
                    Button(action: {
                        showAGSmap = true
                    }) {
                        Text("Map")
                            .font(.headline)
                            .frame(width: 200)
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }

                Spacer()

                NavigationLink(destination: ImpInfoView()) {
                    Text("Important Information")
                        .font(.headline)
                        .frame(width: 200)
                        .padding()
                        .background(Color.purple)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

                Spacer()

                Text("BETA AGS SD build 2")
                    .font(.footnote)
                    .padding(.bottom, 20)
                    .foregroundColor(.white)

                Spacer()

                AGSLogoButton()
            }
            .navigationTitle("AGS Year 7 Gateway")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("AGS Year 7 Gateway")
                        .font(.headline)
                        .foregroundColor(.white)
                }
            }
            .navigationBarItems(leading: Button(action: {
                showFAQ = true
            }) {
                Text("FAQs")
                    .font(.headline)
                    .foregroundColor(.white)
            }
            .sheet(isPresented: $showFAQ) {
                FAQView()
            })
            .padding(.top, 2)
            .background(Color(hex: "#802841").edgesIgnoringSafeArea(.all))
        }
    }
}

struct AGSLogoButton: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Image("AGS-Logo")
                .resizable()
                .frame(width: 60, height: 60)
                .padding(.bottom, 5)
        }
    }
}

struct BannerView: View {
    @State private var currentImageIndex = 0
    private let images = ["agsbackground", "agsbackground2", "s2", "s3", "s4", "s5", "s6", "s7", "s8"]
    private let timer = Timer.publish(every: 7 , on: .main, in: .common).autoconnect()

    var body: some View {
        Image(images[currentImageIndex])
            .resizable()
            .frame(height: 120)
            .edgesIgnoringSafeArea(.horizontal)
            .edgesIgnoringSafeArea(.top)
            .onReceive(timer) { _ in
                currentImageIndex = (currentImageIndex + 1) % images.count
            }
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        
        let red = Double((int >> 16) & 0xFF) / 255.0
        let green = Double((int >> 8) & 0xFF) / 255.0
        let blue = Double(int & 0xFF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}

struct RulesPage: View {
    var body: some View {
        Text("Rules Page")
            .font(.largeTitle)
    }
}

struct AGSLocation: View {
    @State private var coordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 51.81399886621721, longitude: -0.8014580549252044),
        span: MKCoordinateSpan(latitudeDelta: 0.003, longitudeDelta: 0.003)
    )

    let annotations = [
        AnnotationItem(coordinate: CLLocationCoordinate2D(latitude: 51.81399886621721, longitude: -0.8014580549252044), tint: .red),
        AnnotationItem(coordinate: CLLocationCoordinate2D(latitude: 51.81088, longitude: -0.79871), tint: .blue)
    ]

    var body: some View {
        Map(coordinateRegion: $coordinateRegion, annotationItems: annotations) { annotation in
            MapMarker(coordinate: annotation.coordinate, tint: annotation.tint)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct AnnotationItem: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
    let tint: Color
}
