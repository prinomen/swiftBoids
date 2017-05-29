import SpriteKit
import GameplayKit

class GameScene: SKScene {
    let shipTex = SKTexture(imageNamed: "Spaceship")
    var dx = CGFloat()
    var dy = CGFloat()
    var dist = CGFloat()
    
    override func didMove(to view: SKView) {
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        self.backgroundColor = .black
        
        let planet1 = SKShapeNode(circleOfRadius: 36)
        planet1.fillColor = .green
        planet1.physicsBody = SKPhysicsBody(circleOfRadius: 36)
        planet1.physicsBody?.isDynamic = false
        let planetField1 = SKFieldNode.radialGravityField()
        planetField1.strength = -3
        planet1.addChild(planetField1)
        planet1.position = CGPoint(x: -150, y: -50)
        self.addChild(planet1)
        
        let planet2 = SKShapeNode(circleOfRadius: 36)
        planet2.fillColor = .green
        planet2.physicsBody = SKPhysicsBody(circleOfRadius: 36)
        planet2.physicsBody?.isDynamic = false
        let planetField2 = SKFieldNode.radialGravityField()
        planetField2.strength = -3
        planet2.addChild(planetField2)
        planet2.position = CGPoint(x: 0, y: 50)
        self.addChild(planet2)
        
        let shipTex = SKTexture(imageNamed: "Spaceship")
        let ship1 = SKSpriteNode(texture: shipTex, color: .clear, size: CGSize(width: shipTex.size().width / 16, height: shipTex.size().height / 16))
        ship1.name = "ship"
        let shipField1 = SKFieldNode.radialGravityField()
        ship1.physicsBody = SKPhysicsBody(circleOfRadius: shipTex.size().width)
        shipField1.strength = -3
        ship1.addChild(shipField1)
        ship1.position = CGPoint(x: 125, y: 0)
        self.addChild(ship1)
        
        let ship2 = SKSpriteNode(texture: shipTex, color: .clear, size: CGSize(width: shipTex.size().width / 16, height: shipTex.size().height / 16))
        ship2.name = "ship"
        let shipField2 = SKFieldNode.radialGravityField()
        ship2.physicsBody = SKPhysicsBody(circleOfRadius: shipTex.size().width)
        shipField2.strength = -3
        ship2.addChild(shipField2)
        ship2.position = CGPoint(x: 125, y: 0)
        self.addChild(ship2)
        
        let ship3 = SKSpriteNode(texture: shipTex, color: .clear, size: CGSize(width: shipTex.size().width / 16, height: shipTex.size().height / 16))
        ship3.name = "ship"
        let shipField3 = SKFieldNode.radialGravityField()
        ship3.physicsBody = SKPhysicsBody(circleOfRadius: shipTex.size().width)
        shipField3.strength = -3
        ship3.addChild(shipField3)
        ship3.position = CGPoint(x: 125, y: 0)
        self.addChild(ship3)
    }
    
    func touchDown(atPoint pos : CGPoint) {
        let shipList = self["//ship"]
        for ship in shipList {
            dx = pos.x - ship.position.x
            dy = pos.y - ship.position.y
            dist = dx*dx+dy*dy
            if (fabs(dist) > 0.01) {
                dist = sqrt(dist)
                let vx = Float((ship.physicsBody?.velocity.dx)!)
                let vy = Float((ship.physicsBody?.velocity.dy)!)
                ship.zRotation = CGFloat(atan2f(vy, vx) - Float(0.5)) * .pi
                let vxCGFloat = CGFloat(vx)
                let vyCGFloat = CGFloat(vy)
                dx = (dx - vxCGFloat) * dist * 0.0001
                dy = (dy - vyCGFloat) * dist * 0.0001
                ship.physicsBody?.applyImpulse(CGVector(dx: dx, dy: dy))
            }
        }
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        let shipList = self["//ship"]
        for ship in shipList {
            dx = pos.x - ship.position.x
            dy = pos.y - ship.position.y
            dist = dx*dx+dy*dy
            if (fabs(dist) > 0.01) {
                dist = sqrt(dist)
                let vx = Float((ship.physicsBody?.velocity.dx)!)
                let vy = Float((ship.physicsBody?.velocity.dy)!)
                ship.zRotation = CGFloat(atan2f(vy, vx) - Float(0.5)) * .pi
                let vxCGFloat = CGFloat(vx)
                let vyCGFloat = CGFloat(vy)
                dx = (dx - vxCGFloat) * dist * 0.0001
                dy = (dy - vyCGFloat) * dist * 0.0001
                ship.physicsBody?.applyImpulse(CGVector(dx: dx, dy: dy))
            }
        }
    }
    
    func touchUp(atPoint pos : CGPoint) {
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func update(_ currentTime: TimeInterval) {
    }
}
