import bb.cascades 1.0
import bb.cascades.pickers 1.0
import com.example.EasyMemes 1.0
import bb.system 1.0


NavigationPane {
    id: navPane
    function hasNotPurchased()
    {
         console.log("you have not purchased")
        
        
    }
    function hasPurchased()
    {
        getMoreMemesButton.visible=false
        imagesDataModel.source="paidmodel.xml"
    }
    function purchasing()
    {
        console.log("THANKS FOR YOUR SUPPORT")
        myQmlToast.show()	
        
    }
    ////////////////////menuuuuuuuuuuuuuuuuuuuuu///////////////
    
    Menu.definition: MenuDefinition {
        
        // Specify the actions that should be included in the menu
        actions: [
            ActionItem {
                title: qsTr("Help")
                imageSource: "asset:///icons/help.png"
                
                onTriggered: 
                {
                    var helPage = helpView.createObject();
                    navPane.push(helPage)
                }
            },
            
            ActionItem {
                title: qsTr("About") 
                imageSource: "asset:///icons/info.png"
                onTriggered: 
                {
                    var aboutPage = aboutView.createObject();
                    navPane.push(aboutPage)
                }
            },
            ActionItem {
                title: "My Memes"
                imageSource: "asset:///icons/folderopen.png"
                
                onTriggered: 
                {
                    _applicationui.showSavedMemes();
                    var memespage = myMemesView.createObject();
                    memespage.nav =  navPane
                    navPane.push(memespage)
                }
            }
            
            
        ] // end of actions list
    } // end of MenuDefinition
    
    
    
    //////////////////////////menuuuuuuuuuuuuuucuiera///////////////

    Page {
        
        function verificarCompras()
        {
            console.log("hola world1");
            var haComprado= _applicationui.verificarLocalCompras();
            if(haComprado==true)
            {
                hasPurchased();
            }
            else 
            {
            _applicationui.getExistingPurchases(true);
            }
            
        }
        

        
        id:pagegrid
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
                              newPage2.nav =  navPane
                              newPage2.parameterId = path
                              navPane.push(newPage2)
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
                        id:imagesDataModel
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
                        newPage.nav =  navPane
                        newPage.parameterId = selectedItem.image;
                        navPane.push(newPage)
                    }
                   
                    
                }//cierra listview
               
            }//cierra scrollview 
            
            Container 
            {
                
            
            Button 
            {
                id:getMoreMemesButton
                text: "Get More!"
                maxWidth: 768
                preferredWidth: 768
                objectName: "moreMemesName"
                // visible: true
                onClicked: {
                    var morePage = moreMemes.createObject();
                    morePage.nav =  navPane
                    navPane.push(morePage)
                }
            }
            }
            
        }//cierra container
    }//page
    onCreationCompleted: {
        pagegrid.verificarCompras();
        _applicationui.existingPurchasesResponseSuccess.connect(hasNotPurchased)
        _applicationui.existingPurchasesResponseSuccess2.connect(hasPurchased)
        _applicationui.purchaseResponseSuccess.connect(purchasing)
    }

    attachedObjects: 
    [
    SystemToast 
    {
    id: myQmlToast
    body: "Thanks For Your Support"
    onFinished: {
        getMoreMemesButton.visible=false
        imagesDataModel.source="paidmodel.xml"
        navPane.pop()
    }
    },
    ComponentDefinition {
    id: memesPaid
    source: "memesPaid.qml"
    },
    ComponentDefinition {
            id: moreMemes
            source: "GetMoreView.qml"
        },
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
            },
            Page {
                id: paidPage
                content: Container {
                    Label {
                        text: "First attachedObjects Page"
                    }
                }
            }
            ,ComponentDefinition {
                 id:mainPage
                 source: "main.qml"
             }
            
    ]
    


}//navigationpage

