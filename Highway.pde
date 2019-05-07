/**
 * Highway 
 * 
 * A highway object, which is a subclass of CityStreet
 */
class Highway extends CityStreet{
  /**
   * Constructs a new highway object
   * and sets the instance data.
   */ 
  public Highway(){
     super();
     lineColor = color(200, 0, 0);
     stroke = 8;
   }
 }
