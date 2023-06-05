class Obstacle {
    float x, y;
    int obsWidth, obsHeight;
    
    Obstacle(float xPos, float yPos, int w, int h){
        x = xPos;
        y = yPos;
        obsWidth = w;
        obsHeight = h;
    }
    
    boolean collided(PVector p) {
        if (p.x > x && p.x < x + obsWidth) if (p.y > y && p.y < y + obsHeight) return true; else return false;
        else return false;
    }
    
    void draw(){
        rect(x, y, obsWidth, obsHeight);
    }
    
}
