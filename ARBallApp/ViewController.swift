import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    @IBOutlet var visualCuesLabel: UILabel!
    
    var ballNode: SCNNode?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
        let scene = SCNScene(named: "ball.scn")!
        
        // Set the scene to the view
        sceneView.scene = scene
        
        // Add the ball node to the scene
        ballNode = scene.rootNode.childNode(withName: "ball", recursively: true)
        
        // Set up visual cues label
        visualCuesLabel.text = "Follow the ball"
        visualCuesLabel.textColor = .white
        visualCuesLabel.backgroundColor = .black
        visualCuesLabel.layer.cornerRadius = 10
        visualCuesLabel.clipsToBounds = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        // Move the ball node from side to side
        let x = sin(Float(time))
        ballNode?.position = SCNVector3(x, 0, -1)
    }
}