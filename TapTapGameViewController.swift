//
//  TapTapGameViewController.swift
//  Game Clash
//
//  Created by Melvin Corners on 1/5/17.
//  Copyright © 2017 Melvin Corners. All rights reserved.
//

import UIKit
import SceneKit

class TapTapGameViewController: UIViewController {
    
    //Declare a property for SCNView that renders the content of the SCNScene on the display
    var scnView: SCNView!
    
    //Declare a property for the SCNScene in the game. Will add children to this scene like lights, cameras, geometry,e tc.
    var scnScene: SCNScene!
    
    var cameraNode: SCNNode!
    
    var spawnTime: TimeInterval = 0
    
    //Let's you quickly access the GameHelper shared instance, which contains a set of methods to do the heavy lifting fo ryou
    var game = GameHelper.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        setupScene()
        setupCamera()
        setUpHUD()
    }

//    override func shouldAutoRotate() -> Bool {
//        return true
//    }
//    
//    override func prefferedStatusBarHidden() -> Bool {
//        return true
//    }
    
    func setUpView() {
        //Cast self.view to a SCNView and store it in the scnView property so that re-casting is not necessary
        scnView = self.view as! SCNView
        
        //Enables a real-time statistics panal at the bottom of the scene
        scnView.showsStatistics = true
        
        //Let's you manually control the active camera through simple gestures
        scnView.allowsCameraControl = false
        /*
         Single finger swipe: Rotates the active camera around the contents of the scene.
         Two finger swipe: Moves (or pans) the camera left, right, up or down the scene
         Two finger pinch: Zooms the camera in and out of the scene
         Double Tap: if you have more than one camera, this switches between the cameras in your scene. If not, it resets the camera to its original positon
         */
        
        //Creates a generic omnidirectional light in your scene so you don't have to worry about adding your own light sources
        scnView.autoenablesDefaultLighting = true
        
        //This is added because before the view can call this delegate method, ti first needs to know that GameViewController will act as the delegate for the view
        scnView.delegate = self
        
        //This forces the Scene Kit view into an en endless playing mode
        scnView.isPlaying = true
    }
    
    //Creates a new blank instance of SCNScene and stores it in scnScene; it then sets this blank scene as the one for scnView to use
    func setupScene(){
        scnScene = SCNScene()
        scnView.scene = scnScene
        
        //Instructs the scene to load the backgound diffuse image from the asset catalog and use it as the material property of the scene's background
        scnScene.background.contents = "GeometryFighter.scnassets/Textures/Background_Diffuse.png"
    }
    
    func setupCamera(){
        //First create an empty SCNNode and assign it to cameraNode
        cameraNode = SCNNode()
        
        //Next create a new SCNCamera object and assign it to the camera property of cameraNode
        cameraNode.camera = SCNCamera()
        
        //Set the position of the camera on the 3D grid
        cameraNode.position = SCNVector3(x: 0, y: 6.0, z: 10)
        
        //Add the camerNode to the scene as a child node of the scene's root node
        scnScene.rootNode.addChildNode(cameraNode)
    }
    
    func spawnShape(){
        //Creates a placeholder variable for use
        var geometry: SCNGeometry
        
        //Defines a switch statement to handle the returned shape from ShaptType.random()
        switch ShapeType.random(){
        default:
            //Creates an SCNBox object and stores it in geometry. Specifies width, height, and length and chamfer radius (fancy corners)
            geometry = SCNBox(width: 1.0, height: 1.0, length: 1.0, chamferRadius: 0.0)
        }
        
        //To color, you modify 'materials' on 'geometry'; this gets the first available material of 'geometry' and sets the diffuse property's 'contetns' to a random color.
        let color = UIColor.random()
        geometry.materials.first?.diffuse.contents = color
        
        //Creates an insance of SCNNode named geometryNode
        let geometryNode = SCNNode(geometry: geometry)
       
        //Adds the node as a child of the scene's root node
        scnScene.rootNode.addChildNode(geometryNode)
        
        //Creates a new instance of SCNPhysicsBody and assigns it to the physicsBody property of geometryNode
        geometryNode.physicsBody = SCNPhysicsBody(type: .dynamic, shape: nil)
        
        //Creates two random float values that represent the x- and y-components of the force. Uses an extension of Float from the utilities added earlier
        let randomX = Float.random(min: -2, max: 2)
        let randomY = Float.random(min: 10, max: 18)
        
        //Uses those random components to create a vector to represent this force
        let force = SCNVector3(x: randomX, y: randomY, z: 0)
        
        //Creates another vector that represents the position the force will be applied to.
        let position = SCNVector3(x: 0.05, y: 0.05, z: 0.05)
        
        //Using all those components, you apply the force to geometryNode's physical body using this code
        geometryNode.physicsBody?.applyForce(force, at: position, asImpulse: true)
        
        //This uses createTail(_: geometry:) to create a particle sstem to attach it to geometryNode
        let trailEmitter = createTrail(color: color, geometry: geometry)
        geometryNode.addParticleSystem(trailEmitter)
        
        if color == UIColor.black{
            geometryNode.name = "BAD"
        } else {
            geometryNode.name = "GOOD"
        }
    }
    
    func cleanScene(){
        //Creates a little for loop that steps through all available child nodes within the rot node of the scene
        for node in scnScene.rootNode.childNodes {
            
            //Since the physics simulation is in play at this point, you can’t simply look at the object’s position as this reflects the position before the animation started. Scene Kit maintains a copy of the object during the animation and plays it out until the animation is done. It’s a strange concept to understand at first, but you’ll see how this works before long. To get the actual position of an object while it’s animating, you leverage the presentationNode property. This is purely read-only: don’t attempt to modify any values on this property!
            if node.presentation.position.y < -2{
                //This makes an object blink out of sexistence
                node.removeFromParentNode()
            }
        }
    }
    
    //Defines createTrail(_: geometry:) which takes in 'color' and 'geometry' parameters to set up particle system
    func createTrail(color: UIColor, geometry: SCNGeometry) -> SCNParticleSystem {
        
        //Loads the particle system from the file you created earlier
        let trail = SCNParticleSystem(named: "Trail.scnp", inDirectory: nil)!
        
        //Modifies the particle's tint color based on the parameter passed in
        trail.particleColor = color
        
        //Uses the geometry parameter to specify the emitter's shape
        trail.emitterShape = geometry
        
        //Returns the newly created particle system
        return trail
    }
    
    //Makes use of game.hudNode from the helper library. Set its HUD node's position and add it to the scene
    func setUpHUD(){
        game.hudNode.position = SCNVector3(x: 0.0, y: 10.0, z: 0.0)
        scnScene.rootNode.addChildNode(game.hudNode)
    }
    
    //Checks the moniker of the touched node; good nodes increase the score and bad (balck) nodes reduce the number of lives by one. In either case, you remove the node from the screen, and it's destroyed
    func handleTouchFor(node: SCNNode){
        if node.name == "GOOD"{
            game.score += 1
            node.removeFromParentNode()
        } else if node.name == "Bad" {
            game.lives -= 1
            node.removeFromParentNode()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //grab first available touch
        let touch = touches.first!
        
        //Translate the touch location to a location relatve to the coordinaates of scnView
        let location = touch.location(in: scnView)
        
        //Gives an array of SCNHitTestResult objects that represent any intersectoin that hit ray starting form the spot inside the view that th euser touched, and going away from the camera
        let hitResults = scnView.hitTest(location, options: nil)
        
        //Check if there are any results from the hit test
        if hitResults.count > 0{
            
            //If there are, take the first result in the test
            let result = hitResults.first!
            
            //Pass the first result node to your touch handler, which will either increase your score or decrease your score
            handleTouchFor(node: result.node)
        }
        
    }

}



//Adds an extension to GameViewController for protocol conformance and let's you maintain code protocol methods in separate blocks of code
extension TapTapGameViewController: SCNSceneRendererDelegate {
    
    //Adds an implementation of rederer(_: updateAtTime: ) protocol method
    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval){
        //Checks if time (current system time) is greater than the spawnTime.
        if time > spawnTime {
            cleanScene()
            spawnShape()
            //After an object is spawned, update spawnTime with the next time to spawn a new obeject. The next spawn time is simply the current time incremented by a random amount. Since NSTimeInterval is in seconds, you spawn the next object between 0.2 and 1,5 seconds after the current time
            spawnTime = time + TimeInterval(Float.random(min: 0.2, max: 1.5))
            
            //Keeps the HUD updated
            game.updateHUD()
        }
    }

}
