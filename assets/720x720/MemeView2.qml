import bb.cascades 1.0
import bb.system 1.0

Container {
    id:root
    background: Color.create("#FFFFFF")
    layout: AbsoluteLayout {}
    
    function pasarAMayusculas( cadena)
    {
        var global=this
        return cadena.toUpperCase()
    }
    function takeSnapshot()
    {
        console.log("photo")   
        _applicationui.capture(720,720,"1Meme",720,615)
    
    }
    
    
    ImageView 
    {
        id: imagev2
        imageSource:  parameterId
        //imageSource: "asset:///images/philosoraptor.jpg"
        preferredHeight: 615
        preferredWidth: 720
        layoutProperties: AbsoluteLayoutProperties {
            positionX: 0
            positionY: 0
        }
    }
    
    TextArea {
        id:areaUp
        inputMode: TextAreaInputMode.Chat
        preferredWidth: 743
        preferredHeight: 200
        backgroundVisible: false
        hintText: "Tap To Edit"
        textStyle {
            fontSize: FontSize.PointValue
            textAlign: TextAlign.Center
            fontSizeValue: 10000
            fontWeight: FontWeight.Bold
            color: Color.create ("#FFFFFF")
        }
        
        layoutProperties: AbsoluteLayoutProperties {
            positionY: 20
            positionX: 0
        }
        onTextChanged: 
        {
            areaUp.text = root.pasarAMayusculas(areaUp.text)
           // _applicationui.startTimer()
        }
    
    
    }
    
    
    
    TextArea {
        
        id:areaDown
        inputMode: TextAreaInputMode.Chat
        preferredWidth: 743
        maxHeight: 500
        backgroundVisible: false
        
        hintText: "Tap To Edit"
        textStyle {
            fontSize: FontSize.PointValue
            textAlign: TextAlign.Center
            fontSizeValue: 10000
            // fontSize: fontSize.XXLarge
            fontWeight: FontWeight.Bold
            
            color: Color.create ("#FFFFFF")
        }
        
        layoutProperties: AbsoluteLayoutProperties {
            positionY: 480
            positionX: 0
        }
        onTextChanged: 
        {
            areaDown.text = root.pasarAMayusculas(areaDown.text)
            //_applicationui.startTimer()
        }
        
        onCreationCompleted: 
        {
         //   _applicationui.callTimerDone2.connect(takeSnapshot)
        }
    
    }
}