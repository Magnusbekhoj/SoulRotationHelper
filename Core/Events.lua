local SRH = SoulRotationHelper

SRH.Events = SRH.Events or {}
local Events = SRH.Events

Events._registry = Events._registry or {}

function Events:Register(eventName, key, callback)
    if type(eventName) ~= "string" or eventName == "" then return end
    if type(key) ~= "string" or key == "" then return end
    if type(callback) ~= "function" then return end

    local listeners = self._registry[eventName]
    if not listeners then
        listeners = {}
        self._registry[eventName] = listeners
    end

    listeners[key] = callback
end

function Events:Unregister(eventName, key)
    local listeners = self._registry[eventName]
    if not listeners then return end

    listeners[key] = nil
    if not next(listeners) then
        self._registry[eventName] = nil
    end
end

function Events:Fire(eventName, ...)
    local listeners = self._registry[eventName]
    if not listeners then return end

    for _, callback in pairs(listeners) do
        callback(...)
    end
end
