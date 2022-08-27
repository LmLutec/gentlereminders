class ReminderSerializer
    include FastJsonapi::ObjectSerializer
    attributes :message, :author
  
  
    def initialize(reminder)
      @reminder = reminder
    end
   
    def to_serialized_json
      @owner.to_json(:except => [:created_at, :updated_at])
    end
  
   
  
    # (:include => {
    #   :bird => {:only => [:name, :species]},
    #   :location => {:only => [:latitude, :longitude]}
    # }, :except => [:updated_at])
  end
  