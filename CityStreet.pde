/**
 * City Street 
 * 
 * A city street object 
 */
class CityStreet {
  protected color lineColor;
  protected int stroke;
  
  /**
   * Constructs a new city street object
   * and sets the instance data.
   */ 
  public CityStreet(){
    lineColor = color(0);
    stroke = 4;
  }
  
  /**
   * Draws the lines set to the grid
   * @param gridSize the grid size set by the user or the default
   */
  public void drawGrid(int gridSize){
    strokeCap(SQUARE);
    stroke(lineColor);
    strokeWeight(stroke);
    if (mousePressed == true) { //draws while keeping to the grid
      line(floor((mouseX/gridSize)*gridSize), floor((mouseY/gridSize)*gridSize), 
      floor((pmouseX/gridSize)*gridSize), floor((pmouseY/gridSize)*gridSize));
    }
  }
  
  /**
   * Draws the lines freeform
   */
  public void drawFreeform(){
     strokeCap(SQUARE);
     stroke(lineColor);
     strokeWeight(stroke);
     if (mousePressed == true) {
       line(mouseX, mouseY, pmouseX, pmouseY);
    }
   }
}
