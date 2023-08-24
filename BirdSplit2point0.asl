state("BirdGut")
{
    string255 ScenePath : 0x10BDC78, 0x28, 0xC, 0x0;
}

start
{
    return old.Scene == "Menu" && (current.Scene == "TitleSplash" || current.Scene == "Esophagus" || current.Scene == "Stomach" || current.Scene == "Stomach City" || current.Scene == "Stomach City Part 2" || current.Scene == "Stomach Boss" || current.Scene == "SmallIntestines" || current.Scene == "LargeIntestines" || current.Scene == "Colon" || current.Scene == "BombRoom") && settings["il_timing"]; 
}

split
{
    if (current.Scene != old.Scene && (old.Scene == "TitleSplash" || old.Scene == "Esophagus" || old.Scene == "Stomach" || old.Scene == "Stomach City" || old.Scene == "Stomach City Part 2" || old.Scene == "Stomach Boss" || old.Scene == "SmallIntestines" || old.Scene == "LargeIntestines" || old.Scene == "Colon" || old.Scene == "BombRoom") && current.Scene != "Menu")
    {
        return true;
    }
}

reset 
{
    return current.Scene == "Menu" && settings["il_timing"];
}

update
{
    current.Scene = Path.GetFileNameWithoutExtension(current.ScenePath) ?? old.Scene;
}

startup
{
    settings.Add ("il_timing", false, "IL Timing (starts the timer on every level except Prologue, stops the timer on ever level except Missile Chamber)");
}