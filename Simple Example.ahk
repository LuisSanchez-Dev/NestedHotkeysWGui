#Include lib\NestedHotkeysWGui.ahk

;Configure the look of the GUI
NHWGUI_textSize  := 22

;Replaces default shortcut with a menu to open different folders
#e::
nhgMain := New NestedHotkeysWGui("Folders menu")
nhgMain
    .Add("Q","OpenFolder","Visual Studio sources","C:\Users\Luis\source\repos")
    .Add("W","OpenFolder","Users folder"         ,"C:\Users\")
    .Add("E","OpenFolder","Downloads folder"     ,A_MyDocuments "\..\Downloads")
    .Add("A","OpenFolder","Documents folder"     ,A_MyDocuments)
.Run()
Return

OpenFolder(path){
    Run %path%,,max
}