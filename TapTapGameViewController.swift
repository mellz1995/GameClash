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

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        setupScene()
        setupCamera()
        spawnShape()
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
        scnView.allowsCameraControl = true
        /*
         Single finger swipe: Rotates the active camera around the contents of the scene.
         Two finger swipe: Moves (or pans) the camera left, right, up or down the scene
         Two finger pinch: Zooms the camera in and out of the scene
         Double Tap: if you have more than one camera, this switches between the cameras in your scene. If not, it resets the camera to its original positon
         */
        
        //Creates a generic omnidirectional light in your scene so you don't have to worry about adding your own light sources
        scnView.autoenablesDefaultLighting = true
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
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 10)
        
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
        
        //Creates an insance of SCNNode named geometryNode
        let geometryNode = SCNNode(geometry: geometry)
        
        //Adds the node as a child of the scene's root node
        scnScene.rootNode.addChildNode(geometryNode)
    
        
    }
    

}
