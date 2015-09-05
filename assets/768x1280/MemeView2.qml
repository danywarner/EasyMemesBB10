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
        _applicationui.capture(768,1280,"1Meme",768,768)
    
    }
    
    ImageView 
    {
        id: imagev2
        imageSource:  parameterId
        //imageSource: "asset:///images/philosoraptor.jpg"
        preferredWidth: 768
        preferredHeight: 768
        layoutProperties: AbsoluteLayoutProperties 
        {
            positionX: 0
            positionY: 0
        }
    }
    
    TextArea 
    {
        focusAutoShow: FocusAutoShow.Default
        id:areaUp
        inputMode: TextAreaInputMode.Chat
        preferredWidth: 768
        // preferredHeight: 200
        maxHeight: 300
        backgroundVisible: false
        hintText: qsTr("Tap To Edit")
        textStyle 
        {
            fontSize: FontSize.PointValue
            textAlign: TextAlign.Center
            fontSizeValue: 10000
            
            
            fontWeight: FontWeight.Bold
            color: Color.create ("#FFFFFF")
        }
        
        layoutProperties: AbsoluteLayoutProperties 
        {
            positionY: 0
            positionX: 0
        }
        
        onTextChanged: {
            areaUp.text = root.pasarAMayusculas(areaUp.text)
           // _applicationui.startTimer()
        }
    
    
    }
    
    
    
    TextArea {
        
        id:areaDown
        inputMode: TextAreaInputMode.Chat
        preferredWidth: 768
        //  preferredHeight: 200
        maxHeight: 350
        backgroundVisible: false
        
        hintText: qsTr("Tap To Edit")
        textStyle {
            fontSize: FontSize.PointValue
            textAlign: TextAlign.Center
            fontSizeValue: 10000
            // fontSize: fontSize.XXLarge
            fontWeight: FontWeight.Bold
            
            color: Color.create ("#FFFFFF")
        }
        
        layoutProperties: AbsoluteLayoutProperties {
            positionY: 540
            positionX: 0
        }
        
        onTextChanged: {
            areaDown.text = root.pasarAMayusculas(areaDown.text)
          //  _applicationui.startTimer()
        }
    }
    Label {
        text: "Tip: Save Before Sharing"
        layoutProperties: AbsoluteLayoutProperties {
            positionY: 768
            positionX: 0
        }
        textStyle.color: Color.DarkYellow
    }
    Label {
        text: "Tip: Guardar Antes de Compartir"
        layoutProperties: AbsoluteLayoutProperties {
            positionY: 818
            positionX: 0
        }
        textStyle.color: Color.DarkYellow
    }
    
    
    onCreationCompleted: 
    {
       // _applicationui.callTimerDone.connect(takeSnapshot)
    }
}