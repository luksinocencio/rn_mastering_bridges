import SwiftUI

struct AppModal: View {
    var action: () -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            Image("img-bg-welcome")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            
            Text("Seja bem vindo")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Agora que você é um especialista React Native, vamos começar conhecendo nosso app nativo.")
            
            Spacer()
            
            APPButton(title: "Vamos começar", action: action)
        }.padding(16)
    }
}

#Preview {
    AppModal(action: {})
}
