class ConstatState {
  bool declaration;
  bool vehA;
  bool vehB;
  bool croquis;
  int nbVoiture;

  // Constructeur
  ConstatState({
    this.declaration = true,
    this.vehA = false,
    this.vehB = false,
    this.croquis = false,
    this.nbVoiture = 1,
  });
}
