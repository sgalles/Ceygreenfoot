import ceylon.collection { ArrayList }class ActorManager() {        ArrayList<Actor> _allSprites = ArrayList<Actor>();        shared void addActors(Actor actor){        _allSprites.add(actor);    }        shared {Actor*} allSprites = _allSprites;    }