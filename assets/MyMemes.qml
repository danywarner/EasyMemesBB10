import bb.cascades 1.0

Page {
    property NavigationPane nav  
    Container
    {  
        ScrollView 
        {
         	ListView 
            {
                
                function getDirPaths() {
                    return _dirPaths
                }
                
                
                maxHeight: 1200
                dataModel: XmlDataModel 
                {
                    source:  _dirPaths.emmod + "modmymemes.xml"   
                
                }
                
                
                layout: GridListLayout 
                {
                    columnCount: 2
                }
                listItemComponents: 
                [
                    ListItemComponent 
                    {
                        type: "item"
                        ImageView 
                        { 
                            
                            imageSource:  ListItem.view.getDirPaths().ememes+ListItemData.image
                        }    
                    }
                ]   
                onTriggered: {
                    clearSelection()
                    select(indexPath)
                    var selectedItem = dataModel.data(indexPath);
                    var newPage = memeViewer.createObject();
                    newPage.nav =  nav
                    newPage.parameterId = selectedItem.image;
                    nav.push(newPage)
                }
               
            
            }//cierra listview
        }//cierra scrollview 
    }//cierra container
    attachedObjects: 
    [
        
        ComponentDefinition {
            id: memeViewer
            source: "memeViewer.qml"
        }
    ]
}//page
