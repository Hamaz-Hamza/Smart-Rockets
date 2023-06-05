class RocketLaunchAndControlSystem {
    
    Rocket[] rockets = new Rocket[amountOfRockets];
    PVector pos;
    
    RocketLaunchAndControlSystem(float x, float y) {
        pos = new PVector(x,y);
        for(int i=0; i < rockets.length; i++) 
            rockets[i] = new Rocket(x, y, new PVector(0, -1)); 
    }
    
    void run(){
        for (Rocket rocket : rockets) {
            rocket.update();
            rocket.draw();
        }
    }
    
    void nextBatch() {
        rockets[0].evaluateFitness();
        
        Rocket bestRocket = rockets[0];
        Rocket secondBestRocket = rockets[0];
        
        for(int i = 1; i < rockets.length; i++) {
            Rocket current = rockets[i];
            current.evaluateFitness();
            
            if (current.fitness > bestRocket.fitness) {
                secondBestRocket = bestRocket;
                bestRocket = current;
            }
            else if (current.fitness > secondBestRocket.fitness) secondBestRocket = current;
        }
        
        ManoeuvringSystem updatedSystem = bestRocket.manoeuvringSystem.optimize(secondBestRocket.manoeuvringSystem);
        for(int i=0; i < rockets.length; i++)  {
            rockets[i] = new Rocket(pos.x, pos.y, new PVector(0, -1));
            rockets[i].update(updatedSystem);
        }
    }
}
        
        
