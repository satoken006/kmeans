import controlP5.*;

ControlP5 cp5;

Node[] node;
Cluster[] cluster;

final int FIELD_W = 800;
final int FIELD_H = 600;
final int MARGIN = 10;
boolean reassign_mode = false;

void setup(){
  size(1000, 600);
  colorMode(HSB, 360, 100, 100);
  
  node = new Node[100];
  for(int i = 0 ; i < node.length ; i ++){
    node[i] = new Node(random(FIELD_W), random(FIELD_H));
  }
  
  cluster = new Cluster[6];
  for(int i = 0 ; i < cluster.length ; i ++){
    cluster[i] = new Cluster(random(FIELD_W/4, FIELD_W*3/4), random(FIELD_H/4, FIELD_H*3/4), color(360 * float(i)/cluster.length, 100, 100));
  }
  assignNodes();
  addCP5UI();
}

void draw(){
  background(0, 0, 20);
  fill(0, 0, 80);
  noStroke();
  rect(FIELD_W, 0, width - FIELD_W, FIELD_H);  
  
  for(Node nodes : node){
    nodes.draw();
  }
  for(Cluster clusters : cluster){
    clusters.draw();
  }
}

// update which gravity point each node belongs to
void assignNodes(){
  for(int j = 0 ; j < node.length ; j ++){
    for(int i = 0 ; i < cluster.length ; i ++){
      if(i > 0){
        if(dist(node[j].x, node[j].y, cluster[i].x, cluster[i].y) < node[j].getDistance()){
          node[j].setDistance(dist(node[j].x, node[j].y, cluster[i].x, cluster[i].y));
          node[j].setBelongTo(i);
          node[j].setClusterColor(cluster[i].getClusterColor());
        }
      }else{
        node[j].setDistance(dist(node[j].x, node[j].y, cluster[i].x, cluster[i].y));
        node[j].setBelongTo(i);
        node[j].setClusterColor(cluster[i].getClusterColor());
      }
    }
    cluster[node[j].getBelongTo()].node_num ++;
  }
}

// update locations of gravity points
void setBarycenters(){
  PVector[] v = new PVector[cluster.length];
  for(int i = 0 ; i < v.length ; i ++){
    v[i] = new PVector(0, 0);
  }
  
  for(int i = 0 ; i < node.length ; i ++){
    int belong = node[i].getBelongTo();
    v[belong].x += node[i].getLocation().x;
    v[belong].y += node[i].getLocation().y;
  }
  
  for(int i = 0 ; i < cluster.length ; i ++){
    cluster[i].setLocation(v[i].x / cluster[i].getNodesCount(), v[i].y / cluster[i].getNodesCount());
  }
}
