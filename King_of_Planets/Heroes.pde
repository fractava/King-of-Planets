class Admiral_Oculus extends Hero{

  Admiral_Oculus(int newTeamId, float startX, float startY){
    teamId = newTeamId;
    position = new PVector(startX, startY);
    cover = loadImage("Admiral Oculus.png");
    skin = loadImage("Admiral Oculus Top.png");
    speed = 2;
    coolDown = 30;
    maxHealth = 150;
    health = maxHealth;
  }

  void first(){
    game.match.entities.add(new Admiral_Oculus_Shot(teamId, position, direction));
    lastFirst = frameCount;
  }
}

class Ashas extends Hero{
  Ashas(int newTeamId, float startX, float startY){
    teamId = newTeamId;
    position = new PVector(startX, startY);
    cover = loadImage("Ashas.png");
    skin = loadImage("Ashas Top.png");
    speed = 2;
    maxHealth = 200;
    health = maxHealth;
  }
}

class Athon extends Hero{
  Athon(int newTeamId, float startX, float startY){
    teamId = newTeamId;
    position = new PVector(startX, startY);
    cover = loadImage("Athon.png");
    skin = loadImage("Athon Top.png");
    speed = 2;
    maxHealth = 200;
    health = maxHealth;
  }
}

class Burac extends Hero{
  Burac(int newTeamId, float startX, float startY){
    teamId = newTeamId;
    position = new PVector(startX, startY);
    cover = loadImage("Burac.png");
    skin = loadImage("Burac Top.png");
    speed = 2;
    maxHealth = 250;
    health = maxHealth;
  }
}

class Kinetic extends Hero{
  Kinetic(int newTeamId, float startX, float startY){
    teamId = newTeamId;
    position = new PVector(startX, startY);
    cover = loadImage("Kinetic.png");
    skin = loadImage("Kinetic Top.png");
    speed = 2.6;
    maxHealth = 200;
    health = maxHealth;
  }
}

class Vrachos extends Hero{
  Vrachos(int newTeamId, float startX, float startY){
    teamId = newTeamId;
    position = new PVector(startX, startY);
    cover = loadImage("Vrachos.png");
    skin = loadImage("Vrachos Top.png");
    speed = 1.2;
    coolDown = 15;
    maxHealth = 400;
    health = maxHealth;
  }

  void first(){
    game.match.entities.add(new Vrachos_Shot(teamId, position, direction));
    lastFirst = frameCount;
  }
}
