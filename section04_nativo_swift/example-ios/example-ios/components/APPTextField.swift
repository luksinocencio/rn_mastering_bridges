import SwiftUI

enum APPTextFieldType {
    case `default`
    case email
    case password
}

struct APPTextField: View {
    var placeholder: String
    var type: APPTextFieldType = .default
    
    @Binding var value: String
    @State private var isSecure: Bool = true
    
    var body: some View {
        HStack {
            if type == .password {
                Group {
                    if isSecure {
                        SecureField(placeholder, text: $value)
                    } else {
                        TextField(placeholder, text: $value)
                    }
                }
                .textInputAutocapitalization(.none)
                .autocorrectionDisabled(true)

                Button {
                    isSecure.toggle()
                } label: {
                    Image(systemName: isSecure ? "eye.slash" : "eye")
                        .foregroundColor(.gray)
                }
                
            } else {
                TextField(placeholder, text: $value)
                    .keyboardType(keyboardType)
                    .textInputAutocapitalization(.none)
                    .autocorrectionDisabled(true)
                    .autocapitalization(.none)
            }
        }
        .frame(height: 60)
        .padding(.horizontal, 16)
        .background(Color.gray.opacity(0.15))
        .cornerRadius(10)
    }
    
    private var keyboardType: UIKeyboardType {
        switch type {
        case .email:
            return .emailAddress
        default:
            return .default
        }
    }
}

#Preview {
    VStack(spacing: 16) {
        APPTextField(
            placeholder: "E-mail",
            type: .email,
            value: .constant(""),
        )
        
        APPTextField(
            placeholder: "Senha",
            type: .password,
            value: .constant("")
        )
    }
    .padding()
}
