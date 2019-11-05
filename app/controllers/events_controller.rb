class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    # Méthode qui crée un event vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
    @event = Event.new
  end

  def create
    # Méthode qui créé un potin à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
    # Une fois la création faite, on redirige généralement vers la méthode show (pour afficher le potin créé)
    u = User.first
    @event = Event.new(title: params[:title], 
    content: params[:duration])
    @event.user = u
    if @event.save # essaie de sauvegarder en base @gossip
      # si ça marche, il redirige vers la page d'index du site
      flash[:success] = "Tu as ajouter ton super potin."
      redirect_to "/gossips"
    else
      # sinon, il render la view new (qui est celle sur laquelle on est déjà)
      flash.now[:error]
      render action: "new"
    end
  end
end
