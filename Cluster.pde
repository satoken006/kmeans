class Cluster extends PVector{
  color cluster_color;
  int node_num;
  
  Cluster(float x, float y, color cluster_color){
    super(x, y);
    this.cluster_color = cluster_color;
    node_num = 0;
  }
  
  void draw(){
    strokeCap(PROJECT);
    
    stroke(cluster_color);
    strokeWeight(5);
    line(x-3, y-3, x+3, y+3);
    line(x+3, y-3, x-3, y+3);
  }
  
  void setLocation(float x, float y){
    this.x = x;
    this.y = y;
  }
  
  int getNodesCount(){
    return node_num;
  }
  
  color getClusterColor(){
    return cluster_color;
  }
}
