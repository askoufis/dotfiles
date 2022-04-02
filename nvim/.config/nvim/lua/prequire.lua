local function prequire(m)
	local status_ok, module = pcall(require, m)
	if not status_ok then
		return nil
	end

	return module
end

return prequire
