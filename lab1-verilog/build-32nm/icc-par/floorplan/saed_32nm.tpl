template: m45_mesh(w1, w2) {
  layer : M4 {
     direction : vertical
     width : @w1
     pitch : 4
     spacing : minimum
     offset :
  }
  layer : M5 {
     direction : horizontal
     width : @w2
     spacing : minimum
     pitch : 4
     offset :
  }
}
