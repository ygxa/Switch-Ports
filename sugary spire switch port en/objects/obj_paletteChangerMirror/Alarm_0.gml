if (savedIndex != global.PlayerPaletteIndex)
{
	eas_ini_open(global.SaveFileName)
	ini_write_real("Misc", string("playerPaletteIndex_" + scr_getCharacterPrefix(global.playerCharacter)), global.PlayerPaletteIndex)
	eas_ini_close()
	//eas_save(scr_easyasync_callback)
	savedIndex = global.PlayerPaletteIndex
}
