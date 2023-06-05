 
RocketLaunchAndControlSystem rlcs;
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
int amountOfRockets = 400;
int rocketLifeSpan = 300;
PVector target;

void setup() {
   size(1000, 600);
   
   fill(255, 100);
   noStroke();
   rlcs = new RocketLaunchAndControlSystem(width/2, height);
   
   target = new PVector(width/2, 50);
   obstacles.add(new Obstacle(0, 0, 10, height));
   obstacles.add(new Obstacle(width-11, 0, 10, height));
   obstacles.add(new Obstacle(0, 0, width, 10));
   for(int i=0; i < 6; i++) obstacles.add(new Obstacle(random(width), random(height), 200, 50));
}

void draw() {
   background(0);
   
   for (Obstacle obstacle : obstacles) obstacle.draw();
   
   rlcs.run();
   if (rlcs.rockets[0].count == rocketLifeSpan) rlcs.nextBatch();
   
   circle(target.x, target.y ,10);
}
