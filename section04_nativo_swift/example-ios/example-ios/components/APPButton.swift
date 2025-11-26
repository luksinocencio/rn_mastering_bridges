import SwiftUI

enum APPButtonStyle {
    case primary
    case secondary
}

struct APPButton: View {
    var title: String = ""
    var action: () -> Void = {}
    var variant: APPButtonStyle = .primary
    
    
    // MARK: - Computed properties para estilos
    
    private var foregroundColor: Color {
        switch variant {
        case .primary:   return .white
        case .secondary: return .black
        }
    }
    
    private var backgroundColor: Color {
        switch variant {
        case .primary:   return .black
        case .secondary: return .white
        }
    }
    
    private var borderOverlay: some View {
        Group {
            switch variant {
            case .primary:
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.clear, lineWidth: 0)
            case .secondary:
                RoundedRectangle(cornerRadius: 12)
                    .stroke(.black.opacity(0.1), lineWidth: 2)
            }
        }
    }
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .frame(maxWidth: .infinity, maxHeight: 60)
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(foregroundColor)
                .background(backgroundColor)
                .cornerRadius(12)
                .overlay(borderOverlay)
        }
    }
}

#Preview {
    VStack(spacing: 20) {
        APPButton(title: "Primary", action: {}, variant: .primary)
        APPButton(title: "Secondary", action: {}, variant: .secondary)
    }
    .padding()
}
