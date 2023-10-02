import UIKit
import ARKit

class ARViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    var ballNode: SCNNode?
    var reticleNode: SCNNode?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
        let scene = SCNScene()
        
        // Set the scene to the view
        sceneView.scene = scene
        
        // Create a ball node
        let ballGeometry = SCNSphere(radius: 0.1)
        let ballMaterial = SCNMaterial()
        ballMaterial.diffuse.contents = UIImage(named: "ball.png")
        ballGeometry.materials = [ballMaterial]
        ballNode = SCNNode(geometry: ballGeometry)
        ballNode?.position = SCNVector3(0, 0, -1)
        
        // Add the ball node to the scene
        sceneView.scene.rootNode.addChildNode(ballNode!)
        
        // Create a reticle node
        let reticleGeometry = SCNSphere(radius: 0.05)
        let reticleMaterial = SCNMaterial()
        reticleMaterial.diffuse.contents = UIColor.white
        reticleGeometry.materials = [reticleMaterial]
        reticleNode = SCNNode(geometry: reticleGeometry)
        reticleNode?.position = SCNVector3(0, 0, -1.5)
        
        // Add the reticle node to the scene
        sceneView.scene.rootNode.addChildNode(reticleNode!)
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        // Update the reticle node's position to point to the ball's current location
        if let ballNode = ballNode, let reticleNode = reticleNode {
            let ballPosition = sceneView.projectPoint(ballNode.position)
            let reticlePosition = SCNVector3(Float(ballPosition.x), Float(ballPosition.y), -1.5)
            reticleNode.position = reticlePosition
        }
    }
    
    func setUpARSession() {
        // Set up the AR session configuration
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = [.horizontal, .vertical]
        sceneView.session.run(configuration)
    }
}