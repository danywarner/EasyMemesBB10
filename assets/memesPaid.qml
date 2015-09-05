import bb.cascades 1.0
import bb.cascades.pickers 1.0

NavigationPane {
    id:paidNavPane
    property NavigationPane nav
    
    Menu.definition: MenuDefinition {
        
        // Specify the actions that should be included in the menu
        actions: [
            ActionItem {
                title: qsTr("Help")
                imageSource: "asset:///icons/help.png"
                
                onTriggered: 
                {
                    var helPage = helpView.createObject();
                    paidNavPane.push(helPage)
                }
            },
            
            ActionItem {
                title: qsTr("About") 
                imageSource: "asset:///icons/info.png"
                onTriggered: 
                {
                    var aboutPage = aboutView.createObject();
                    paidNavPane.push(aboutPage)
                }
            },
            ActionItem {
                title: "My Memes"
                imageSource: "asset:///icons/folderopen.png"
                
                onTriggered: 
                {
                    _applicationui.showSavedMemes();
                    var memespage = myMemesView.createObject();
                    memespage.nav =  paidNavPane
                    paidNavPane.push(memespage)
                }
            }
        
        
        ] // end of actions list
    } // end of MenuDefinition
    
    Page {
        id:pagegrid2
        property string  memeValue: "none"
        titleBar: TitleBar 
        {
            // Localized text with the dynamic translation and locale updates support
            title: qsTr("Select Your Meme") + Retranslate.onLocaleOrLanguageChanged
            
            acceptAction: ActionItem 
            {
                title: "Choose..."
                onTriggered: 
                {
                    picker.open()
                }
            }
            attachedObjects: 
            [
                FilePicker 
                {
                    id: picker
                    
                    property string selectedFile
                    
                    title: qsTr ("Choose Picture")
                    mode: FilePickerMode.Picker  
                    defaultType: FileType.Picture
                    type: FileType.Picture
                    viewMode: FilePickerViewMode.ListView
                    sortBy: FilePickerSortFlag.Default
                    sortOrder: FilePickerSortOrder.Ascending
                    onFileSelected: 
                    {
                        selectedFile = selectedFiles[0]
                        // var path=selectedFile.substring(15,selectedFile.length)
                        var path = "file://"+selectedFile
                        
                        var newPage2 = memeEditor2.createObject();
                        newPage2.nav =  paidNavPane
                        newPage2.parameterId = path
                        paidNavPane.push(newPage2)
                    }
                
                
                }
            ]
        
        }
        
        Container
        {
            
            ScrollView 
            {
                
                
                
                ListView 
                {
                    maxHeight: 1200
                    dataModel: XmlDataModel 
                    {
                        source: "model.xml"
                    }
                    
                    
                    layout: GridListLayout 
                    {
                        columnCount: 3
                    }
                    listItemComponents: 
                    [
                        ListItemComponent 
                        {
                            type: "item"
                            CustomButton 
                            {
                            
                            
                            }  
                        }
                    
                    ]   
                    
                    onTriggered: {
                        clearSelection()
                        select(indexPath)
                        var selectedItem = dataModel.data(indexPath);
                        var newPage = memeEditor.createObject();
                        newPage.nav =  paidNavPane
                        newPage.parameterId = selectedItem.image;
                        paidNavPane.push(newPage)
                    }
                
                
                }//cierra listview
            
            }//cierra scrollview 
        }//cierrra container

    }//page
        attachedObjects: 
        [
            ComponentDefinition {
                id: memeEditor2
                source: "memeEditor2.qml"
            },
            ComponentDefinition {
                id: memeEditor
                source: "memeEditor.qml"
            },
            ComponentDefinition {
                id: helpView
                source: "HelpView.qml"
            },
            ComponentDefinition {
                id: myMemesView
                source: "MyMemes.qml"
            },
            ComponentDefinition {
                id: aboutView
                source: "AboutView.qml"
            }
            
        ]
    
}//NavPane
 
    
    
