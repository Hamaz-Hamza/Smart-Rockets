class Rocket {
    
    PVector pos;
    PVector vel;
    ManoeuvringSystem manoeuvringSystem;
    int count = 0;
    int timeTookToReach = 1;
    float fitness = 0;
    boolean crashed = false;
    float closestDistance = 10000;
    
    Rocket(float x, float y, PVector velocity) { 
        pos = new PVector(x,y); 
        vel = velocity.copy();
        manoeuvringSystem = new ManoeuvringSystem();
    }
    
    void update(){
        if (count != rocketLifeSpan) vel.add(manoeuvringSystem.forces[count++]);
        vel.limit(8);
        if (timeTookToReach == 1 && !crashed) pos.add(vel);
        for (Obstacle obstacle : obstacles) if (obstacle.collided(pos)) crashed = true;
        float dist = dist(pos.x, pos.y, target.x, target.y);
        if (dist < 20) timeTookToReach = count;
        else if (dist < closestDistance) closestDistance = dist;
    }
    
    void draw(){
        push();
        translate(pos.x, pos.y);
        rotate(vel.heading() + HALF_PI);
        rect(0, 0, 5, 20);
        pop();
    }
    
    void evaluateFitness() {
        float distanceFromTarget = dist(pos.x, pos.y, target.x, target.y);
        if (distanceFromTarget < 20) fitness += 500;
        if (timeTookToReach == 1) timeTookToReach = rocketLifeSpan;
        fitness += -(2*distanceFromTarget + timeTookToReach/2 + closestDistance) + (width + height);
    }
    
    void update(ManoeuvringSystem updatedSystem) {
        for(int i=0; i < 5; i++) manoeuvringSystem.forces[i] = updatedSystem.forces[i].copy().add(PVector.random2D().setMag(0.1));  
        for(int i=5; i < rocketLifeSpan; i++) manoeuvringSystem.forces[i] = updatedSystem.forces[i].copy().add(PVector.random2D().setMag(0.04)); 
    }
        
}
