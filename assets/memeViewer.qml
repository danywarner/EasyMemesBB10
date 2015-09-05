import bb.cascades 1.0
import bb.cascades.pickers 1.0
import bb.system 1.0

Page {
    property string parameterId: ""
    property string memename;
    property NavigationPane nav  
    function uppercases( cadena)
    {
        var global=this
        return cadena.toString().toUppercase()
    }
    
    
    Container 
    {
        layout: DockLayout{}
        
        MemeShow 
        {
            id:memeInstance
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Top
        }
    }
    attachedObjects: 
    [
        
        ComponentDefinition 
        {
            id: myMemes
            source: "MyMemes.qml"
        }
        
    ]
    
    actions: [
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
        
        InvokeActionItem 
        {
            title: qsTr("Set As                          ")
            imageSource: "asset:///icons/setasavatar.png"
            //ActionBar.placement: ActionBarPlacement.OnBar
            query 
            {
                //invokeTargetId: "sys.bbm.imagehandler"
                invokeActionId: "bb.action.SET"
                uri: _dirPaths.files + "1Meme.jpg"
            }
        },
        
       
        
       /* ActionItem 
        {
            title: qsTr ("My Memes")
            imageSource: "asset:///icons/folderopen.png"
            
            onTriggered: 
            {
                _applicationui.showSavedMemes();
                var memespage = mymemes.createObject();
                memespage.nav =  nav
                nav.push(memespage)
            }
        },*/
        ActionItem 
        {
            title: qsTr ("Erase")
            imageSource: "asset:///icons/erase.png"
            
            onTriggered: 
            {    
                _applicationui.eraseFile("shared/misc/easymemes/"+parameterId);
                _applicationui.eraseFile("shared/misc/easymemes/mod/modmymemes.xml");
                _applicationui.showSavedMemes();
                var memespage = myMemes.createObject();
                memespage.nav =  nav
                nav.push(memespage)
                myQmlToast.show()	 
            }
            attachedObjects: 
            [
                SystemToast 
                {
                    id: myQmlToast
                    body: "The Image has been deleted"
                }
            ]
        }
             
    ]

}





