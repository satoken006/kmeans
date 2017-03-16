class Node extends PVector{
  int belongTo;
  float distance;
  color cluster_color;
  
  Node(float x, float y){
    super(x, y);
    belongTo = 0;
  }
  
  void draw(){
    stroke(cluster_color);
    strokeCap(ROUND);
    
    strokeWeight(7);
    point(x, y);
    
    strokeWeight(0.5);
    line(x, y, cluster[belongTo].x, cluster[belongTo].y);
  }
  
  int getBelongTo(){
    return belongTo;
  }
  
  float getDistance(){
    return distance;
  }
  
  PVector getLocation(){
    return new PVector(x, y);
  }
  
  void setBelongTo(int belongTo){
    this.belongTo = belongTo; 
  }
  
  void setDistance(float distance){
    this.distance = distance;
  }
  
  void setLocation(float x, float y){
    this.x = x;
    this.y = y;
  }
  
  void setClusterColor(color this_cluster){
    this.cluster_color = this_cluster;
  }
}
