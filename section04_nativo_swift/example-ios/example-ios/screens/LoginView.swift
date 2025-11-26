import SwiftUI

struct LoginView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showAlert: Bool = false
    @State private var showModal: Bool = false
    
    func handlePressSignIn() {
        if email == "teste@mail.com" && password == "123" {
            print("Usuario valido")
            showAlert = false
            showModal = true
        } else {
            print("Usuario invalido")
            showAlert = true
        }
    }
    
    func handlePressSignUp() {
        print("#handlePressSignUp")
    }
    
    var body: some View {
        VStack {
            Spacer()
            
            Image("img-logo")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            
            Spacer()
            
            APPTextField(placeholder: "E-mail", value: $email)
            APPTextField(placeholder: "Senha", type: .password, value: $password)
            
            Spacer()
            
            APPButton(title: "Entrar", action: handlePressSignIn)
            APPButton(title: "Cadastrar", action: handlePressSignUp, variant: .secondary)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .sheet(isPresented: $showModal) {
            AppModal(action: {
                print("vamos começar!")
            })
                .presentationDetents([.large])
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Ops!"),
                message: Text("Parece que seus dados estão incorretos."),
                primaryButton: .default(Text("Tentar novamente"), action: {}),
                secondaryButton: .cancel()
            )
        }
    }
}

#Preview {
    LoginView()
}
