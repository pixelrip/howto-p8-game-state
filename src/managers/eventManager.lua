-- Event manager
eventManager = {
    subscribers = {}
}

-- A listener is a function to call when the event happens
function eventManager:subscribe(eventName, listener)
    if not self.subscribers[eventName] then
        self.subscribers[eventName] = {}
    end
    
    add(self.subscribers[eventName], listener)
end

-- Call all listner functions for a given event
function eventManager:publish(eventName, ...)
    if not self.subscribers[eventName] then return end

    for listener in all(self.subscribers[eventName]) do
        listener(...)
    end
end

