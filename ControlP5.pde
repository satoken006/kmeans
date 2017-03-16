void addCP5UI(){
  cp5 = new ControlP5(this);
  createCP5Button(cp5,   "STEP", FIELD_W + MARGIN,       MARGIN);
  createCP5Button(cp5, "UPDATE", FIELD_W + MARGIN, 100 + MARGIN);
}

Button createCP5Button(ControlP5 controlP5, String label, int x, int y){
  Button button = controlP5.addButton(label)
                           .setPosition(x, y)
                           .setSize(100, 50);
  button.getCaptionLabel().align(ControlP5Constants.CENTER, ControlP5Constants.CENTER);
  return button;
}

Textfield createTextfield( ControlP5 controlP5, String name, int x, int y ){
  Textfield textfield = controlP5.addTextfield(name, x, y, 100, 30);
  return textfield;
}

Textfield createCP5TextField(){
  Textfield f = null;
  return f;
}

void controlEvent(ControlEvent event){
  if( event.getName() == "STEP" ){
    if( reassign_mode ){
      for(int i = 0 ; i < cluster.length ; i ++){
        cluster[i].node_num = 0;
      }
      assignNodes();
    }else{
      setBarycenters();
    }
    reassign_mode ^= true;
  }
}