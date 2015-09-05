import bb.cascades 1.0
//import bb.cascades.pickers 1.0


Page {
    property string parameterId: ""
    property string memename;
    property NavigationPane nav  
    
    function uppercases( cadena)
    {
        var global=this
        return cadena.toString().toUppercase()
    }
    function takeSnapshot()
    {
        console.log("photoz30")   
        _applicationui.capture(720,1280,"1Meme",720,720)
        _applicationui.saveMeme()
    
    }
    
    
    Container 
    {
        layout: DockLayout{}
        
        MemeView2 
        {
            id:memeInstance
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Top   
        }
    }
    
    
    attachedObjects: [
        ComponentDefinition {
            id: mymemes
            source: "MyMemes.qml"
        }
    
    ]
    
    
    actions: [
        
        InvokeActionItem 
        {
            title: qsTr("Set As                                   ")
            imageSource: "asset:///icons/setasavatar.png"
            //ActionBar.placement: ActionBarPlacement.OnBar
            query {
             //   invokeTargetId: "sys.bbm.imagehandler"
                invokeActionId: "bb.action.SET"
                uri: _dirPaths.files + "1Meme.jpg"
            
            }
        },
        
        InvokeActionItem {
            ActionBar.placement: ActionBarPlacement.OnBar
            title: qsTr("Share")
            query {
                mimeType: "image/jpeg"
                invokeActionId: "bb.action.SHARE"
                // Share an image that is packaged with the app
                uri: _dirPaths.files + "1Meme.jpg"
            }
        },
        
        
        
        ActionItem 
        {
            title: qsTr ("Save")
            imageSource: "asset:///icons/folder.png"
            ActionBar.placement: ActionBarPlacement.OnBar
            
            onTriggered: 
            {
                
                takeSnapshot()
            
            
            }
        }
   
    ]




}





