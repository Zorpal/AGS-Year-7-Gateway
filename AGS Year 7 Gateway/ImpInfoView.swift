import SwiftUI
import PDFKit

struct ImpInfoView: View {
    var body: some View {
        ZStack {
            Color(hex: "#802841")
                .edgesIgnoringSafeArea(.all)
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
                
                NavigationLink(destination: PDFKitView(named: "CANTEEN_MENU")) {
                    Text("Canteen Menu ☕️")
                        .font(.headline)
                        .frame(width: 200)
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Spacer().frame(height: 20)
                
                NavigationLink(destination: laptopView()) {
                    Text("Buying a Chromebook!")
                        .font(.headline)
                        .frame(width: 200)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Spacer().frame(height: 20)            }
            .navigationTitle("Important Information")
            .navigationBarTitleDisplayMode(.inline)
            
            Spacer()
        }
        AGSLogoButton()
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

struct laptopView: View {
    var body: some View {
        ZStack {
            Color(hex: "#802841")
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack {
                    Text("""
                         What is a Chromebook?
                         
                         A Chromebook runs a Linux-based operating system called ChromeOS
                         
                         Chromebooks are made by a range of manufacturers
                         
                         They are designed with the cloud in mind
                         
                         There are thousands of apps and extensions available, many of them free
                         
                         CHROMEBOOK FEATURES
                         
                         Less than 8 seconds to boot up
                         Long battery life
                         Simple technology
                         Easy student-teacher workflow
                         Excellent collaboration tools
                         Works seamlessly with Google Workspace for Education and other cloud-based applications which all of our students and teachers already use extensively
                         Students can create, share and collaborate using Google Workspace for Education and use subject related apps in the classroom and at home
                         Traditional methods of learning and teaching still have an important place in education and will continue in our school.  Chromebooks should be seen as an educational tool, not as a replacement for these methods.  We will train our teachers and teach our students to use these devices productively and appropriately.
                         
                          
                         
                         Suggested Models
                         
                         We recommend buying a 14″ Chromebook Plus model with a Full HD screen (1920 x 1080).  11.6″ screens won’t allow you to see enough of the screen when using things like Photopea or OnShape, so although they are highly portable they will quickly be outgrown by the students.   Something like the ASUS Chromebook Plus CX3402CBA will be perfect – cheap, reliable, and easy to repair if the screen breaks.
                         
                         Please check the Auto Update Policy before buying a Chromebook.  This is the date from when the Chromebook will stop receiving updates.  Some models like the Asus CX1 are still being sold but have an AUE date of June 2027, which would mean your Chromebook would quickly become obsolete.  You can find the list here: https://support.google.com/chrome/a/answer/6220366?hl=en
                         
                         Current best deals (Updated 23/10/24)
                         
                         Refurbished (As good as new but much cheaper – keep an eye out for Ebay’s frequent event based discount codes)
                         
                          
                         
                         New
                         
                         https://www.amazon.co.uk/ASUS-Chromebook-CX3402CBA-i3-1215U-Operating/dp/B0CFM5SG9B
                         
                          
                         
                         Suggested Cases
                         
                         Please buy a padded water resistant case.  Laptop sleeves are too thin and do not protect the laptop from drops or water bottle spillages.
                         
                         https://www.amazon.co.uk/dp/B0798SZPNL/
                          
                         https://www.amazon.co.uk/TECOOL-Protective-Briefcase-Chromebook-2016-2019-Dark-Grey/dp/B07YWVQSFQ/
                          
                         
                         Why Chromebooks?
                         
                         In a future where technology will underpin almost all future roles (according to experts including the World Economic Forum), it is incumbent on us all to prepare our students for this digital future and equip them with the requisite skills and expertise.  Drawing on insights from across the globe, we observe the widespread adoption of personalised and collaborative digital learning into schools and note that the pandemic only served to accelerate this trajectory.  It is easy to forget that Facebook and Google, some of today’s most valuable companies globally, did not exist 17 and 23 years ago respectively and a reminder that we must prepare our students for a future workplace that might not yet exist today.
                         
                         With digital expertise and competence threaded into our teaching, we can ensure all students have equal access to digital skills and can thrive in the digital world.  Students will strengthen their collaborative skills in project-based learning and become more adept at researching, analysing and presenting their ideas in a digital context. Ultimately, in the future, our students will need to solve problems that do not yet exist, and be able to confidently draw on their creative problem-solving and digital skills.
                         
                         Aylesbury Grammar School has adopted a 1:1 system, where students have their own Chromebook device in every lesson.  Chromebooks are not a replacement of our existing excellent teaching.  Pen and paper and all the traditional teaching excellence will continue in the classroom and this is especially important whilst public exams continue to be paper-based.  Instead, the Chromebooks bring an additional teaching tool into the classroom, enabling students to conduct extensive research in support of their learning, collaborate in project-based learning and access more personalised learning with greater scope for extension tasks and supportive frameworks.
                         
                          
                         
                         Some of the key benefits of Chromebooks to students are :
                         
                         Increased collaborative working between students and additionally with teachers
                         Student-led and extensive research, accessing the latest information
                         Enriched curriculum, through varied digital mediums and apps
                         Improved student organisation and presentation of work
                          
                         
                         Chromebooks, as a device, offer a number of advantages :
                         
                         Value for money
                         Long battery life, lasting up to 8 hours
                         Under 8 seconds to boot up for each lesson
                         Simple intuitive technology for students to navigate
                         Access to wide range of free Google Apps for Education
                         Student-work is automatically saved and cannot be lost
                         Very resistant to viruses and Trojans
                         Familiarity of tools for students and staff, as we are already a Google-suite school
                          
                         
                         Do I have to buy a Chromebook?
                         
                         There is no compulsion to buy a Chromebook but we hope that parents and students will be sufficiently convinced of the benefits of owning a device that can be used both in school and at home that they do choose to purchase one.
                         
                         Students who don’t have a Chromebook will need to be allocated a laptop on a half termly basis.  If you would like your child to borrow a Chromebook from School, please complete this short online form: https://forms.gle/TBrAUCaXL1vSUxjWA
                         
                         Students who attract Pupil Premium can use their funding to purchase Chromebook via the school.  Other parents who face financial hardship can apply for financial support, please submit this in writing to the Headmaster.
                         
                          
                         
                         Why can my child not bring/use a different device?
                         
                         We have visited other schools running 1:1 iPad and laptop programmes and consulted in-depth with our teachers. We learned that iPads are great tools for consuming media but they are not as good for creating content and allowing our students to work collaboratively. Whilst the range of applications available on iPads and Android is vast, many of the resources that teachers currently use in IT Suites would not be available.
                         
                         We also looked at traditional Windows, Mac and Linux laptops. Although these devices are indeed more powerful, they are also more complex, more expensive and have poorer battery lifetimes.
                         
                         The simplicity of the Chromebook overcomes these barriers so that the focus will be on learning. They are fully compatible with the Google Workspace and other sites that we will be using for teaching and learning.
                         
                         From a school perspective, there are two very important issues that make the Chromebook our device of choice:
                         
                         The IT department cannot support and fix multiple types of devices, nor can our teachers be expected to understand the different problems that they will present in the classroom. For example, if a student is struggling to connect to the wi-fi during a lesson where you find the settings will be dependent on the device being used and different routes around the device operating system will need to be taken on each.  With all students using a Chromebook this makes troubleshooting easy as they all operate in the same way.
                         
                         The other issue for us as a school is our responsibility to Safeguarding and the Prevent Agenda. One of the apps we talk about is the Google Management Licence which we deploy to the Chromebooks when we enrol them onto our system. There are a few other devices that can be enrolled but not many. We need this for security and management. This app allows us to manage the students’ devices whilst in school. The other app we deploy is Senso which can only be deployed to a school managed device that is either enrolled in the Chrome Management system or in our Active directory.  Senso monitors the devices’ use in school and among other things logs incidents of inappropriate behaviour.  A teacher can also use Senso to manage a classroom of devices, make sure they stay on task, push out resources, share screens and much more.
                         
                          
                         
                         How will students use Chromebooks in lessons?
                         
                         Students will use Chromebooks in many different ways in lessons, there is not a one size fits all approach. Departments and teachers are best placed to judge when and how using Chromebooks enhances the curriculum. Some lessons will use Chromebooks extensively, whereas others won’t. As Chromebooks wake from sleep mode quickly, they can be used for short tasks between other classroom activities.
                         
                         Chromebooks can be used in place of some work on paper which will help support students to embed everyday IT skills.
                         
                         Note taking
                         Recording data in tables and graphs
                         Drawing diagrams
                         Organising their time
                         Organising their notes
                         Even more excitingly, using Chromebooks will enable students to engage in learning tasks previously not possible in conventional classrooms.
                         
                         Answer instantly marked short quizzes to gauge understanding and direct lessons.
                         Carry out simulated tasks
                         Explore 3D environments
                         Research topics
                         Collaborate on a piece of work with ease
                         Revise work neatly with ease
                         Recording videos and audio
                          
                         
                         Tips and key reminders
                         
                         Please see the links below for some useful tips that may be helpful when setting up or using your new device;
                         
                         Getting started with my Chromebook
                         How to connect to wifi at home
                         How to connect a printer
                         How to customise my desktop / shelf
                         Keyboard shortcuts
                         How to set Chrome as my default browser
                         How to change my Chromebook password
                         How to view your Classroom Calendar
                         How to organise your Google Drive
                         Key reminders;
                         
                         Your Chromebook is optimised for using the cloud. You should be storing as much of your work as possible on Google Drive rather than locally on your device. This will mean that if you ever forget your device and need to borrow one, all of your files will be accessible.
                         Shortcuts are invaluable. Chromebooks use a variety of shortcuts to perform regularly used tasks. Here are some of the most useful shortcuts;
                         Ctrl + Shift + L – Lock your Chromebook’s screen.
                         Ctrl + Shift + Q – Log out of your Chromebook. Press the key combination twice to quit.
                         Alt + E – Open the Chrome browser’s menu. This only works if a Chrome browser window is open and focused.
                         Alt + 1-8 – Launch applications located on Chrome OS’s “shelf,” or taskbar. For example, Alt + 1 will launch the first application shortcut from the left.
                         Ctrl + Z to undo, and use the standard Ctrl+X, Ctrl+C, and Ctrl+V shortcuts to Cut, Copy and Paste.
                         Press Ctrl + Alt + ? (or Ctrl + Alt + / ) to open a keyboard shortcut cheat sheet at any time. This cheat sheet allows you to view all your Chromebook’s keyboard shortcuts. Whether you’re looking up a keyboard shortcut you forgot, you want to master all the keyboard shortcuts, or you’re just curious, this overlay will help you master those keyboard shortcuts.
                         Chromebook battery Life is excellent. Charging each evening will allow your device to last all the way through the following school day. Get into the habit of putting your device on to charge each evening to ensure you are never caught without power.
                         Don’t forget the school’s IT policy. You should make sure that you are using your Chromebook appropriately. Any poor behaviour will result in sanctions as per the school’s behaviour policy.
                         """)
                    .font(.body)
                    .padding()
                    .cornerRadius(10)
                    .padding(.top, 10)
                    Spacer()
                }
                AGSLogoButton()
            }
        }
    }
}
