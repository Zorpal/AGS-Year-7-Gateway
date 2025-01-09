import SwiftUI
import WebKit

struct HousesView: View {
    var body: some View {
        ZStack {
            Color(hex: "#802841")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Text("Houses")
                    .font(.largeTitle)
                    .padding(.top, 20)
                
                Spacer()
                
                VStack(spacing: 20) {
                    NavigationLink(destination: DensonView()) {
                        Text("Denson")
                            .frame(width: 200)
                            .font(.headline)
                            .padding()
                            .background(Color.teal)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    NavigationLink(destination: HampdenView()) {
                        Text("Hampden")
                            .frame(width: 200)
                            .font(.headline)
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    NavigationLink(destination: LeeView()) {
                        Text("Lee")
                            .frame(width: 200)
                            .font(.headline)
                            .padding()
                            .background(Color.yellow)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    NavigationLink(destination: PatersonView()) {
                        Text("Patterson")
                            .frame(width: 200)
                            .font(.headline)
                            .padding()
                            .background(Color.purple)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    NavigationLink(destination: PhillipsView()) {
                        Text("Phillips")
                            .frame(width: 200)
                            .font(.headline)
                            .padding()
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    NavigationLink(destination: RidleyView()) {
                        Text("Ridley")
                            .frame(width: 200)
                            .font(.headline)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    Spacer()
                    
                    AGSLogoButton()
                }
                
                Spacer()
            }
        }
        .navigationTitle("Houses")
    }
}

struct DensonView: View {
    var body: some View {
        VStack {
            Text("Denson House")
                .font(.largeTitle)
                .padding(.top, 20)
            
            Spacer()
            
            Text("Watch the video below to meet the Head of House!")
                .font(.headline)
                .padding(10)
                .padding(.bottom, 10)
                .multilineTextAlignment(.center)
            
            DensonYouTubeVideoView(videoID: "83C6AfPoA70")
                .frame(height: 215)
                .padding()
            
            Spacer()
            
            Text("""
                 Head of House: Mr T Walker
                 Lore: Denson House was named after the first President of the Old Boys’ Association, Thomas Denson. He was also the first to leave a bequest to the school.
                 """)
                .font(.body)
                .padding()
                .cornerRadius(10)
                .padding(.top, 10)
            
            Spacer()
            AGSLogoButton()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.cyan)
    }
}

struct DensonYouTubeVideoView: UIViewRepresentable {
    let videoID: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let youtubeURL = URL(string: "https://www.youtube.com/embed/\(videoID)") else { return }
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: youtubeURL))
    }
}

struct HampdenView: View {
    var body: some View {
        VStack {
            Text("Hampden House")
                .font(.largeTitle)
                .padding(.top, 20)
            
            Spacer()
            
            Text("Watch the video below to meet the Head of House!")
                .font(.headline)
                .padding(10)
                .padding(.bottom, 10)
                .multilineTextAlignment(.center)
            
            HampdenYouTubeVideoView(videoID: "83C6AfPoA70")
                .frame(height: 215)
                .padding()
            
            Spacer()
            
            Text("""
                Head of House: Mr J Taylor
                
                Hampden House was named after Sir John Hampden, a great local Parliamentarian who opposed Charles I and his taxes. John Hampden died of his wounds after the Battle of Chalgrove.
                """)
                .font(.body)
                .padding()
                .cornerRadius(10)
                .padding(.top, 10)
            
            Spacer()
            AGSLogoButton()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.green)
    }
}

struct HampdenYouTubeVideoView: UIViewRepresentable {
    let videoID: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let youtubeURL = URL(string: "https://www.youtube.com/embed/\(videoID)") else { return }
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: youtubeURL))
    }
}

struct LeeView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("Lee House")
                    .font(.largeTitle)
                    .padding(.top, 20)
                    .foregroundStyle(Color.black)
                
                Spacer()
                
                Text("Watch the video below to meet the Head of House!")
                    .font(.headline)
                    .padding(10)
                    .padding(.bottom, 10)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color.black)
                
                LeeYouTubeVideoView(videoID: "83C6AfPoA70")
                    .frame(height: 215)
                    .padding()
                
                Spacer()
                
                Text("""
                 Head of House: Mrs K Harris
                 
                 Lore: Sir Henry Lee was the original founder of the school in 1598 so it seems strange perhaps that his name was only first used when Lee became the fifth AGS House in 1974. Sir Henry Lee of Ditchley was Lord of the Manor of Fleet Marston and Quarrendon. He farmed the estate at Quarrendon and the history books tell us that he had one of the largest flocks of sheep in the country!
                 """)
                .font(.body)
                .padding()
                .cornerRadius(10)
                .padding(.top, 10)
                .foregroundStyle(Color.black)
                
                Spacer()
                AGSLogoButton()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.yellow)
        }
        .background(Color.yellow)
    }
}

struct LeeYouTubeVideoView: UIViewRepresentable {
    let videoID: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let youtubeURL = URL(string: "https://www.youtube.com/embed/\(videoID)") else { return }
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: youtubeURL))
    }
}

struct PatersonView: View {
    var body: some View {
        VStack {
            Text("Paterson House")
                .font(.largeTitle)
                .padding(.top, 20)
            
            Spacer()
            
            Text("Watch the video below to meet the Head of House!")
                .font(.headline)
                .padding(10)
                .padding(.bottom, 10)
                .multilineTextAlignment(.center)
            
            PatersonYouTubeVideoView(videoID: "83C6AfPoA70")
                .frame(height: 215)
                .padding()
            
            Spacer()
            
            Text("""
                Head of House: Ms K Chalk
                
                Paterson was the sixth and final AGS House to be created and began competing in 1981. It was named after Mrs Olive Paterson, former Chair of the Governing Body and former Mayor of Aylesbury. Her son, John Paterson was also Chairman of Governors in the 1990s. It was Olive Paterson who opened the rebuilt Hall and original Science Laboratories following fire damage in 1954.
                """)
                .font(.body)
                .padding()
                .cornerRadius(10)
                .padding(.top, 10)
            
            Spacer()
            AGSLogoButton()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.purple)
    }
}

struct PatersonYouTubeVideoView: UIViewRepresentable {
    let videoID: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let youtubeURL = URL(string: "https://www.youtube.com/embed/\(videoID)") else { return }
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: youtubeURL))
    }
}

struct PhillipsView: View {
    var body: some View {
        VStack {
            Text("Phillips House")
                .font(.largeTitle)
                .padding(.top, 20)
            
            Spacer()
            
            Text("Watch the video below to meet the Head of House!")
                .font(.headline)
                .padding(10)
                .padding(.bottom, 10)
                .multilineTextAlignment(.center)
            
            PhillipsYouTubeVideoView(videoID: "83C6AfPoA70")
                .frame(height: 215)
                .padding()
            
            Spacer()
            
            Text("""
                Head of House: Mrs R Jackson
                
                Henry Phillips, gentleman of London, ‘enlarged and more amply provided’ for the school with a bequest of £5,000 in 1714, the equivalent to well over £1,000,000 in today’s money. Sir Henry Phillips was the son of the High Sherriff for Buckinghamshire in 1716. Curiously little is known of Phillips, barring the above and that he was born in Aylesbury. Certainly without the endowment and bequest of Lee and Phillips, AGS would not exist today.
                """)
                .font(.body)
                .padding()
                .cornerRadius(10)
                .padding(.top, 10)
            
            Spacer()
            AGSLogoButton()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.red)
    }
}

struct PhillipsYouTubeVideoView: UIViewRepresentable {
    let videoID: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let youtubeURL = URL(string: "https://www.youtube.com/embed/\(videoID)") else { return }
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: youtubeURL))
    }
}

struct RidleyView: View {
    var body: some View {
        VStack {
            Text("Ridley House")
                .font(.largeTitle)
                .padding(.top, 20)
            
            Spacer()
            
            Text("Watch the video below to meet the Head of House!")
                .font(.headline)
                .padding(10)
                .padding(.bottom, 10)
                .multilineTextAlignment(.center)
            
            RidleyYouTubeVideoView(videoID: "fNNT0OdW4gk")
                .frame(height: 215)
                .padding()
            
            Spacer()
            
            Text("""
                Head of House: Mr J Barrie
                
                Ridley House was named after the Reverend Christopher Ridley, the last Headmaster of the Old School before it became a mixed school in 1907. Reverend Ridley arrived at AGS in 1893 when there were just 130 boys in the school and his annual salary was just over £100.
                """)
                .font(.body)
                .padding()
                .cornerRadius(10)
                .padding(.top, 10)
            
            Spacer()
            AGSLogoButton()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.blue)
    }
}

struct RidleyYouTubeVideoView: UIViewRepresentable {
    let videoID: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let youtubeURL = URL(string: "https://www.youtube.com/embed/\(videoID)") else { return }
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: youtubeURL))
    }
}
