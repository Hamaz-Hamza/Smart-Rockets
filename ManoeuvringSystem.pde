class ManoeuvringSystem {
    
    PVector[] forces = new PVector[rocketLifeSpan];
    
    ManoeuvringSystem() { for(int i=0; i < forces.length; i++) forces[i] = PVector.random2D().setMag(1);}
    
    ManoeuvringSystem(PVector[] forces) { for(int i=0; i < forces.length; i++) this.forces[i] = forces[i]; }
    
    ManoeuvringSystem optimize(ManoeuvringSystem system){
        PVector[] optimizedForces = new PVector[rocketLifeSpan];
        for(int i=0; i < optimizedForces.length; i++) optimizedForces[i] = average(forces[i], system.forces[i]);
        return new ManoeuvringSystem(optimizedForces);
    }
    
    PVector average(PVector v1, PVector v2){ return new PVector(average(v1.x, v2.x), average(v1.y, v2.y)); }
    float average(float f1, float f2) { return (f1 + f2) / 2.0f; }
}
        
