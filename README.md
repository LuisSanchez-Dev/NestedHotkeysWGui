# NestedHotkeysWGui
An ahk class to create nested hotkeys with a GUI

## Getting started
### Installation
Download the [repository](https://github.com/LuisSanchez-Dev/NestedHotkeysWGui/archive/master.zip) and create your new script next to the `lib` folder.

### Example
```ahk
#Include lib\NestedHotkeysWGui.ahk  ;If you saved the file in the lib folder next to your script

;Customize the look of the GUI
NHWGUI_bgColor   := "580316"
NHWGUI_textColor := "A0DFFF"
NHWGUI_textSize  := 18

!K::
nhg:= New NestedHotkeysWGui("Title")
nhg
  .Add(key,functionName, description, (Optional)parameter)
  /* 
  For example: 
  key        := "P",
  function   := "MyFunction",
  description:= "Show msgbox with 123",
  parameter  := "123"
  */
  .Add(...)
  .Add(...)
  .Add(...)
  .Add(...)
.Run()
Return

MyFunction(parameter){
  MsgBox %parameter%
}
```
#### Usage
To use this you would do the following:
* Press the hotkey to run the GUI
* Press a letter shown on the GUI
* Task starts running!

#### Exit the GUI
* To exit/cancel the current GUI press *Escape*
* Press any other key not present in the GUI's information

## More examples
* [Simple Example](https://github.com/LuisSanchez-Dev/NestedHotkeysWGui/blob/master/Simple%20Example.ahk) - This functional example replaces the shortcut Windows+E with a GUI including different folders instead of the default.
![Simple Example Image](https://raw.githubusercontent.com/LuisSanchez-Dev/NestedHotkeysWGui/master/Simple%20Example.png)

* [Nested Hotkeys](https://github.com/LuisSanchez-Dev/NestedHotkeysWGui/blob/master/Nested%20Hotkeys.ahk) - This example shows how to add GUIs inside GUIs, expanding the functionality of your keyboard massively.
