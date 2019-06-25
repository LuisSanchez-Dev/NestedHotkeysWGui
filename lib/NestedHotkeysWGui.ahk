global NHWGUI_bgColor   := "212121",
global NHWGUI_textColor := "D3DAE0"
global NHWGUI_textSize  := 24

Class NestedHotKeysWGui{
    ;guiNumber:=""
    selectedKeys:=Object()
    selectedParameters:=Object()
    selectedFunctions:=Object()

    __New(title){
        this.guiNumber:= RegExReplace(RandomStr(), "\W", "i")
        ;this.guiNumber := title
        name:=this.guiNumber
        Gui, %name%:New
        Gui, %name%:-Caption +AlwaysOnTop +ToolWindow
        Gui, %name%:Color, %NHWGUI_bgColor%
        Gui, %name%:Font, +Bold s%NHWGUI_textSize% c%NHWGUI_textColor% underline, Helvetica
        wWrap:=Round((A_ScreenWidth/3))
        Gui, %name%:Add, Text,+Wrap w%wWrap%, %title%
        Gui, %name%:Font
        Gui, %name%:Font, c%NHWGUI_textColor%
    }
    Add( hotKey, function, desc, param:=""){
        name:=this.guiNumber
        Gui, %name%:Font, -Bold s%NHWGUI_textSize%, Lucida Console
        Gui, %name%:Add, Text,x25, %hotKey%

        wWrap:=A_ScreenWidth-(2*(A_ScreenWidth/3))-50

        labelTextSize := NHWGUI_textSize-2
        Gui, %name%:Font, -Bold s%labelTextSize%, Calibri
        Gui, %name%:Add, Text, +Wrap w%wWrap% x+10 yp-3, %desc%

        this.selectedKeys.Insert(hotKey)
        this.selectedFunctions.Insert(function)
        
        this.selectedParameters.Insert(param)
        return this
    }
    Run(){
        name:=this.guiNumber

        posX := 2*(A_ScreenWidth/3)
        width := A_ScreenWidth-posX
        Gui, %name%:Show, x%posX% y0 w%width% h%A_ScreenHeight%
        data:=""
        for i,selectedKey in this.selectedKeys
            data:="," selectedKey "" data
        Input, subkey, L1, {Esc},%data%
        for i, selectedKey in this.selectedKeys {
            if (selectedKey=subkey) {
                if (IsFunc(this.selectedFunctions[i])) {
                    fn:=this.selectedFunctions[i]
                    Gui, %name%:Hide
                    %fn%(this.selectedParameters[i])
                }
            }
        }
        Gui, %name%:Hide
    }
}

RandomStr(l = 16, i = 48, x = 122) { ; length, lowest and highest Asc value
	Loop, %l% {
		Random, r, i, x
		s .= Chr(r)
	}
	Return, s
}