/**
 * Map Builder 
 * 
 * The file from which to run the map simulation from.
 * Contains all of the GUI elements as well.
 */
import controlP5.*;

ControlP5 cp5;
CityStreet cs;
Button b1, b2, b3, b4, b5, b6;
RadioButton r1;
boolean gridded = false;
boolean show = false;
int gridSize = 25;

/**
 * Sets up the window with GUI elements.
 */
void setup() {
  size(500, 500);
  cp5 = new ControlP5(this);
  background(255);
  b1 = cp5.addButton("Backroad")
     .setPosition(90,10)
     .setValue(0)
     .setSize(80,20);    
  b2 = cp5.addButton("Highway")
     .setPosition(175,10)
     .setValue(0)
     .setSize(80,20);
  b3 = cp5.addButton("River")
     .setPosition(260,10)
     .setValue(0)
     .setSize(80,20);
  b4 = cp5.addButton("City")
     .setPosition(5,10)
     .setValue(0)
     .setSize(80,20);
  r1 = cp5.addRadioButton("Gridded")
     .setPosition(345,10)
     .setSize(20,20)
     .setColorForeground(color(120))
     .setColorActive(color(0))
     .setColorLabel(color(0))
     .setItemsPerRow(2)
     .setSpacingColumn(25)
     .addItem("Grid", 1)
     .addItem("Freeform", 2);
  b5 = cp5.addButton("Clear")
     .setPosition(10,470)
     .setValue(100)
     .setSize(80,20);
  b6 = cp5.addButton("showGrid")
     .setPosition(100,470)
     .setSize(80,20)
     .setValue(0);
  cp5.addTextfield("GridSize")
     .setPosition(190,470)
     .setSize(20,15)
     .setFocus(true)
     .setColor(255)
     .setColorCaptionLabel(0);
}

/**
 * Draws the grid and calls the draw methods
 * for either grid or freeform drawing.
 */
void draw() {
  stroke(0);
  strokeWeight(1);
  if (gridded == false) {
    cs.drawFreeform();
  } else { 
      if (show == false) {
        stroke(255);
        for (int i = 0; i < width/gridSize; i++){  //makes the grid in white
          line(i*gridSize, 0, i*gridSize, height); //to handle "erasing" the grid
        }
        for (int i = 0; i < height/gridSize; i++){
          line(0, i*gridSize, width, i*gridSize);
        }
      } else {
        stroke(0);
        for (int i = 0; i < width/gridSize; i++){  //makes the grid in black
          line(i*gridSize, 0, i*gridSize, height);
        }
        for (int i = 0; i < height/gridSize; i++){
          line(0, i*gridSize, width, i*gridSize);
        }
      }
      cs.drawGrid(gridSize);
    }
  }

/**
 * Takes in input from the Backroad button
 * and switches the street to a backroad.
 */
public void Backroad() {
  cs = new BackStreet();
}

/**
 * Takes in input from the Highway button
 * and switches the street to a highway.
 */
public void Highway() {
  cs = new Highway();
}

/**
 * Takes in input from the City button
 * and switches the street to a city street.
 */
public void City() {
  cs = new CityStreet();
}

/**
 * Takes in input from the River button
 * and switches the street to a river.
 */
public void River() {
  cs = new River();
}

/**
 * Takes in input from the Gridded radio button
 * and switches boolean to corresponding choice.
 * Clears canvas when switching.
 * @param a the button pressed
 */
public void Gridded(int a) {
  if (a == 1) {
    Clear();
    gridded = true;
  } 
  if (a == 2) {
    Clear();          //Current functionality does not allow for 
    gridded = false;  //mixing freeform and gridded drawings.
  }  
}
/**
 * Takes in input from the Show Grid button
 * and switches boolean to corresponding choice.
 */
public void showGrid() {
  if (show == false) {
    show = true;
  } else {
    show = false;
  }
}
/**
 * Clears the canvas.
 */
public void Clear() {
  background(255);
}

/**
 * Takes in input from the GridSize text field,
 * clears the canvas, and sets the new grid size.
 * @param theText the text input into the text field
 */
public void GridSize(String theText) {
  background(255);  //Setting a new grid size requires starting a new painting.
  gridSize = Integer.parseInt(theText);
}
