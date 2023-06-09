accounts_count = 0
for k,v in ipairs(getAccounts()) do 
    accounts_count = accounts_count + 1
end

save_data = {}



function setLoginServer(account_name,password,save_state,sound_state,language_selection)
    local account = getPlayerAccount(source)
    if not isGuestAccount ( account ) then 
        outputChatBox(language[language_selection]["logged"],source,255,0,0)
        triggerClientEvent(source,"dm-login:loggedin",source)
        return 
    end
    account = getAccount(account_name)
    if account then
        local state = logIn(source,account,password)
        if state then 
            if save_state then 
                save_data[getPlayerSerial(source)] = {
                    account_name = account_name,
                    password = password,
                    language = language_selection,
                    music_state = sound_state,
                }
            end
            triggerClientEvent(source,"dm-login:loggedin",source)
        else
            outputChatBox(language[language_selection]["false_password"],source,255,0,0)
        end
    else
        outputChatBox(language[language_selection]["false_account_name"],source,255,0,0)
    end
end
-------------------------------------------------------
-- Create Account
--------------------------------------------------------
function createAccount(account_name,password,mail,save_state)
    local account = getAccount(account_name)
    if account then 
        outputChatBox(language[language_selection]["existing_account"],source,255,0,0)
        return 
    end
    local account = addAccount(account_name,password)
    if account then 
        accounts_count = accounts_count + 1
        local details = {
            account_name =account_name,
            password = password,
            mail = mail,
            id =  accounts_count,
        }
        setAccountData(account,"account-details",toJSON(details))
        logIn(source,account,password)
        if save_state then 
            save_data[getPlayerSerial(source)] = {
                account_name = account_name,
                password = password,
                language = language,
            }
        end
        triggerClientEvent(source,"dm-login:loggedin",source)
    end
end


--------------------------------------------------------
--on player connect
--------------------------------------------------------
function connectPlayer()
    local serial = getPlayerSerial(source)
    if save_data[serial] then 
        triggerClientEvent(source,"dm-login:connectPlayer",source,save_data[serial])
    end
end
addEventHandler("onPlayerJoin",root,connectPlayer)

----------------------------------------
-- fforgotPassword
----------------------------------------
function forgotPasswordServer(account_name)
    local account = getAccount(account_name)
    if account then 
        local data = fromJSON(getAccountData(account,"account-details"))
        local eposta = data.mail
        local name = getPlayerName(source)
        local ip = "Drift Masters"
        local serial = getPlayerSerial(source)
        local kod = data.password
        local hesapismi = data.account_name
        callRemote ("http://SITEN_veya_IP_ADRESIN/mail/mailyolla.php", function(sum) end,eposta ,name ,ip,serial ,kod ,hesapismi) 
    end
end
events = {
    {event_name = "dm-login:setLogin",func = setLoginServer },
    {event_name = "dm-login:registerAccount",func = createAccount},
    {event_name = "dm-login:forgotPassword",func = forgotPasswordServer},
}

for k,v in ipairs(events) do
    if v.event_name and v.func then 
        addEvent(v.event_name,true)
        addEventHandler(v.event_name,root,v.func)
    end
end
