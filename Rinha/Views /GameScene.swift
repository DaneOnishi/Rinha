import SwiftUI
import RealityKit

struct MyARView: View {
    var body: some View {
        return ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)

        // Carregar o ponto âncora do arquivo "Box" (essa é a sua cena/modelo 3D)
        if let sceneAnchor = try? Entity.loadAnchor(named: "Box") {
            // Adicionar a cena dentro da cena da ARView
            arView.scene.addAnchor(sceneAnchor)
        }
        
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#if DEBUG
struct ARContentView_Previews : PreviewProvider {
    static var previews: some View {
        MyARView()
    }
}
#endif
