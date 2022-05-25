module GoalHelper 

    def fetch_goals
        goals = $redis.get("goals") 
        if goals.nil? 
            goals = Goal.where(topic:"My first goal").to_json 
            $redis.set("goals", goals) 
            $redis.expire("goals",3.hour.to_i) #Кэш обновляется каждые 3 часа
        end 
        @goals = JSON.load goals 
    end 
end 