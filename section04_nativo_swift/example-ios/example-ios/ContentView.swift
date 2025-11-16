import SwiftUI

struct ContentView: View {
    
    func handlePress() {
        print("#handlePress")
    }
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Login")
                .font(.system(size: 40))
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            TextField("Email", text: .constant(""))
                .frame(height: 40)
                .padding(10)
                .background(.gray.opacity(0.2))
                .cornerRadius(10)
                .keyboardType(.emailAddress)
            
            SecureField("Password", text: .constant(""))
                .frame(height: 40)
                .padding(10)
                .background(.gray.opacity(0.2))
                .cornerRadius(10)
                .padding([.top], 16)
            
            Spacer()
            
            Button(action: handlePress) {
                Text("Entrar")
                    .frame(maxWidth: .infinity, maxHeight: 60)
                    .background(.black)
                    .cornerRadius(12)
                    .foregroundColor(.white)
                    .font(.system(size: 20))
                    .fontWeight(.bold)
            }
            
            Button(action: {}) {
                Text("Cadastrar")
                    .frame(maxWidth: .infinity, maxHeight: 60)
                    .cornerRadius(12)
                    .background(.white)
                    .foregroundColor(.black)
                    .font(.system(size: 20))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(.black.opacity(0.1), lineWidth: 2)
                    )
                    .fontWeight(.bold)
            }
            
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
    }
}

#Preview {
    ContentView()
}
