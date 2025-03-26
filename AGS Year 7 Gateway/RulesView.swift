import SwiftUI

struct RulesView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    HStack {
                        Text("Aylesbury Grammar School likes to pride itself in a well-mannered and respectful environment. We believe through respect the school will become a better place and more importantly you. In order to achieve this, our school has some expectations all students follow.")
                            .padding(.horizontal)
                            .multilineTextAlignment(.leading)
                    }
                    Spacer()

                    VStack(alignment: .leading, spacing: 12) {
                        ForEach([
                            "No harassment is allowed towards teachers or students.",
                            "No bullying is allowed towards teachers or students.",
                            "No discrimination is allowed towards teachers or students.",
                            "No hurtful actions are allowed towards teachers or students.",
                            "One must follow the one-way system.",
                            "When a teacher walks in the room, please stand up as a sign of respect.",
                            "No running in the corridors.",
                            "No littering.",
                            "No pushing in queues.",
                            "One must submit homework on time.",
                            "Listen carefully to all teachers.",
                            "No chewing gum.",
                            "No wearing headphones in school.",
                            "Usage of phones is not allowed, excluding Sixth Form in the sixth form area.",
                            "Raise your hand if you have something to say.",
                            "Chromebooks must be charged every night before school and should only be used when the teachers say so.",
                            "One must be quiet during lessons unless a teacher allows you to speak.",
                            "Remember to tap in with your key fob if you are late to school.",
                            "Must attend registration and arrive at school on time.",
                            "Going on the school field is not allowed unless permitted by the Headmaster."
                        ], id: \.self) { rule in
                            HStack(alignment: .top) {
                                Text("•")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(.blue)
                                Text(rule)
                            }
                        }
                    }
                    .padding(.horizontal)
                    Spacer()
                    Text("We hope you understand that school rules such as these will make our studying environment a better place where everyone can prosper.")
                        .padding(.horizontal)
                        .multilineTextAlignment(.leading)
                }
                .padding()
                AGSLogoButton()
                .navigationTitle("Rules")
            }
            .navigationViewStyle(.stack)
        }
    }
}
