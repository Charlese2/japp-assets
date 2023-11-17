local AD = RegisterPlugin('Alternate Dimension', '1.0.0', '13.6.1')

AddClientCommand( 'amAltDim', function( player, args )
	-- Don't allow switching dimensions while dueling
	if player.isDueling then
		return
	end

	-- Make sure you are not near other players hitbox while trying switch dimensions
	for _, otherPlayer in ipairs(GetPlayers()) do
		if player.id ~= otherPlayer.id then
			if math.abs(math.sqrt((player.position.x - otherPlayer.position.x)^2 + (player.position.y - otherPlayer.position.y)^2)) < 40 then
				SendReliableCommand( player.id, 'print "' .. "Can not switch dimensions while inside another player" .. '\n"' )
				return
			end
		end
	end

	if player.eFlags & EFlags.ALT_DIM ~= 0 then
		-- Set ALT_DIM EFlag
		player.eFlags = player.eFlags ~ EFlags.ALT_DIM
	else
		-- Unset ALT_DIM EFlag
		player.eFlags = player.eFlags ~ EFlags.ALT_DIM
	end
end)
