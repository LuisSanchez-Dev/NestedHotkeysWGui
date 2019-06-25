#NoTrayIcon
#SingleInstance, force
#Include lib\NestedHotkeysWGui.ahk

;---------------------------------------
;|  To know when the script restarted  |
;---------------------------------------
SoundBeep, 2000, 80
SoundBeep, 2500, 80
SoundBeep, 3000, 80

;-----------------------------------
;|  Configure the look of the GUI  |
;|        (Global variables)       |
;-----------------------------------
NHWGUI_bgColor   :="580316"
NHWGUI_textColor := "A0DFFF"
NHWGUI_textSize  := 18

;-------------------
;|  Reload Script  |
;-------------------
INSERT & `::
  SoundBeep, 2000,100
  Run %A_ScriptFullPath%
Return

;------------------------
;|  Write common stuff  |
;------------------------
INSERT & q::
  nhgCommonData := New NestedHotkeysWGui("Write")
  nhgCommonData
    .Add("Q","WriteEmails","E-mails")
    .Add("W","WritePhones","Phone Numbers")
  .Run()
  
  WriteEmails(){
    nhgWriteEmails := New NestedHotkeysWGui("Write Email")
    nhgWriteEmails
      .Add("Q","Write","personal@hotmail.com" ,"personal@hotmail.com")
      .Add("W","Write","personal@gmail.com"   ,"personal@gmail.com")
      .Add("E","Write","business@hotmail.com" ,"business@hotmail.com")
      .Add("R","Write","fun@hotmail.com"      ,"fun@hotmail.com")
    .Run()
  }
  WritePhones(){
    nhgWritePhones := New NestedHotkeysWGui("Write Phones")
    nhgWritePhones
      .Add("Q","Write","John's Number"   ,"5550123")
      .Add("W","Write","Monica's Number" ,"5551234")
    .Run()
  }
Return

;---------------------------
;|  Quick programs access  |
;---------------------------
INSERT & w::
    nhgPrograms:= New NestedHotkeysWGui("Programs Quick Access")
    nhgPrograms
      .Add("Q","ShowOrRunProgram","Vivaldi"            ,["ahk_exe vivaldi.exe" ,"vivaldi.exe"])
      .Add("W","ShowOrRunProgram","VS Code"            ,["ahk_exe code.exe"    ,"C:\Users\Luis\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Visual Studio Code\Visual Studio Code.lnk"])
      .Add("E","ShowOrRunProgram","Visual Studio 2017" ,["ahk_exe devenv.exe"  ,"C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\Common7\IDE\devenv.exe"])
      .Add("R","ShowOrRunProgram","Putty"              ,["ahk_exe putty.exe"   ,"putty.exe"])
      .Add("A","OfficeProducts"  ,"+ Office Products")
      .Add("S","ShowOrRunProgram","Streamlabs Chatbot" ,["ahk_exe Streamlabs Chatbot.exe" ,"C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Streamlabs\Streamlabs Chatbot\Streamlabs Chatbot.lnk"])
      .Add("D","ShowOrRunProgram","Discord"            ,["ahk_exe Discord.exe"            , A_AppData "\..\Local\Discord\Update.exe --processStart Discord.exe"])
    .Run()
    OfficeProducts(){
      nhgOP:=New NestedHotkeysWGui(">Office Products")
      nhgOP
        .Add("Q","ShowOrRunProgram","Word"       ,["ahk_exe WINWORD.EXE"  ,"C:\Program Files (x86)\Microsoft Office\root\Office16\WINWORD.EXE"])
        .Add("W","ShowOrRunProgram","Excel"      ,["ahk_exe EXCEL.EXE"    ,"C:\Program Files (x86)\Microsoft Office\root\Office16\EXCEL.EXE"])
        .Add("E","ShowOrRunProgram","PowerPoint" ,["ahk_exe POWERPNT.EXE" ,"C:\Program Files (x86)\Microsoft Office\root\Office16\POWERPNT.EXE"])
        .Add("R","ShowOrRunProgram","Outlook"    ,["ahk_exe OUTLOOK.EXE"  ,"C:\Program Files (x86)\Microsoft Office\root\Office16\OUTLOOK.EXE"])
      .Run()
    }
Return

;--------------------------
;|  Quick folders access  |
;--------------------------
INSERT & e::
  nhgFolder:= New NestedHotkeysWGui("Folder Navigation")
  nhgFolder
    .Add("Q","OpenProgrammingFolders" ,"+ Programming")
    .Add("W","Run","Google Drive"     ,"C:\Users\Luis\Google Drive")
    .Add("E","Run","Chatbot Scripts"  ,"C:\Users\Luis\AppData\Roaming\Streamlabs\Streamlabs Chatbot\Services\Scripts")
    .Add("D","Run","Documents folder" ,A_MyDocuments)
  .Run()
  
  OpenProgrammingFolders(){
    nhgProgrammingFolders:=New NestedHotkeysWGui(">Programming")
    nhgProgrammingFolders
      .Add("Q","Run","AHK"    ,"C:\Users\Luis\Google Drive\Programming\AHK")
      .Add("W","Run","C#"     ,"C:\Users\Luis\source\repos")
      .Add("E","Run","Java"   ,"C:\Java")
      .Add("R","Run","Node JS","C:\NodeJs")
    .Run()
  }
Return

;--------------------
;|  Favorite links  |
;--------------------
INSERT & f::
  nhgFavURLs := New NestedHotkeysWGui("URLs")
  nhgFavURLs
    .Add("Q","TwitchURLs","+ Twitch")
    .Add("W","Run"   ,"Youtube"        ,"https://www.youtube.com/")
    .Add("E","Run"   ,"Google"         ,"https://www.google.com/")
    .Add("R","Run"   ,"Reddit"         ,"https://reddit.com/")
    .Add("S","Run"   ,"Speedtest.net"  ,"https://www.speedtest.net``/")
  .Run()
  TwitchURLs(){
    nhgTwitchURLs := new NestedHotkeysWGui("Twitch URLs")
    nhgTwitchURLs
      .Add("Q", "Run","Streamer1's Channel" ,"https://twitch.tv/streamer1/")
      .Add("W", "Run","Streamer1's Chat"    ,"https://twitch.tv/popout/streamer1/chat?popout=")
      .Add("E", "Run","Streamer2's Channel"  ,"https://twitch.tv/streamer2/")
      .Add("R", "Run","Streamer2's Chat"     ,"https://twitch.tv/popout/streamer2/chat?popout=")
    .Run()
  }
Return


;-----------------------------
;|  Functions Used in Menus  |
;-----------------------------
;Lists all subfolders in a folder on a new GUI
ShowSubFolders(path){
    nhgSubFolders:=New NestedHotkeysWGui(path)
    folderKeys:=["Q","W","E","R","A","S","D","F","Z","X","C","V"]
    subFolders=
    Loop, %path%\*,2
    {
        subFolders=%subFolders%%A_LoopFileTimeModified%|%A_LoopFileFullPath%|%A_LoopFileName%`n
    }
    Sort, subFolders, N R
    i:=1
    Loop, Parse,subFolders,`n
    {
        item:=StrSplit(A_LoopField,"|")
        nhgSubFolders.Add(folderKeys[i],"Run",item[3],item[2])
        i:=i+1
        If (i>folderKeys.MaxIndex())
            Break
    }
    nhgSubFolders.Run()
}
Run(path){
  Run %path%,,max
}
ShowOrRunProgram(params){
  windowIdentifier:=params[1]
  programPath:=params[2]
  IfWinExist %windowIdentifier%
    WinActivate %windowIdentifier%
  Else
    Run %programPath%,,max
}
Write(msg){
  oldClipboard := Clipboard
  Clipboard := msg
  ClipWait
  Send ^v
  Sleep 50
  Clipboard := oldClipboard
}