import bb.cascades 1.0
import bb.system 1.0

Container {
    id:ruth
    background: Color.create("#FFFFFF")
    layout: AbsoluteLayout {}
    
    function pasarAMayusculas(cadena)
    {
        var global=this
        return cadena.toUpperCase()
    }
    
    function takeSnapshot()
    {
        console.log("photo")   
        _applicationui.capture(720,1280,"1Meme",720,720)
    
    }
    
    
    
    ImageView 
    {
        id: imagev2
        imageSource:  "asset:///images/"+parameterId
        // imageSource: "asset:///images/philosoraptor.jpg"
        preferredWidth: 720
        preferredHeight: 720
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
        onTextChanged: {
            areaUp.text = ruth.pasarAMayusculas(areaUp.text)
          //  _applicationui.startTimer()
        }
    
    }
    
    
    TextArea {
        
        id:areaDown
        inputMode: TextAreaInputMode.Chat
        
        preferredWidth: 743
        preferredHeight: 500
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
            positionY: 560
            positionX: 0
        }
        onTextChanged: {
            areaDown.text = ruth.pasarAMayusculas(areaDown.text)
         //   _applicationui.startTimer()
        
        }
    
    }  
    Label {
        text: "Tip: Save Before Sharing"
        layoutProperties: AbsoluteLayoutProperties {
            positionY: 738
            positionX: 0
        }
        textStyle.color: Color.DarkYellow
    }
    Label {
        text: "Tip: Guardar Antes de Compartir"
        layoutProperties: AbsoluteLayoutProperties {
            positionY: 788
            positionX: 0
        }
        textStyle.color: Color.DarkYellow
    }
    
    onCreationCompleted: 
    {
     //   _applicationui.callTimerDone.connect(takeSnapshot)
        
    }
    

}