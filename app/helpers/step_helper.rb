module StepHelper 

    def fetch_steps
        steps = $redis.get("steps") 
        if steps.nil? 
            steps = Step.where(status:"в процессе").to_json 
            $redis.set("steps", steps) 
            $redis.expire("steps",3.hour.to_i) #Кэш обновляется каждые 3 часа
        end 
        @steps = JSON.load steps 
    end 
end 