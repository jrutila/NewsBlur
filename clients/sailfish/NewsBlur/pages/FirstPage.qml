import QtQuick 2.0
import Sailfish.Silica 1.0
import "newsblurApi.js" as Api
//import Sailfish.Silica.theme 1.0

Page {
    id: page

    function loaded(jsonObject)
    {
        console.log("Updating feedsModel");
        feedsModel.clear();
        for (var f in jsonObject.feeds)
        {
            var feed = jsonObject.feeds[f];
            console.log("Append "+feed.feed_title);
            feedsModel.append(feed);
        }
    }

    ListModel {
        id: feedsModel

        ListElement {
            feed_title: "kaljaisuuden hippeli"
        }
        ListElement {
            feed_title: "teekkari"
        }
    }

    // To enable PullDownMenu, place our content in a SilicaFlickable
    SilicaFlickable {
        anchors.fill: parent
        
        // PullDownMenu and PushUpMenu must be declared in SilicaFlickable, SilicaListView or SilicaGridView
        PullDownMenu {
            MenuItem {
                text: "Settings"
                onClicked: pageStack.push(Qt.resolvedUrl("Settings.qml"))
            }
            MenuItem {
                text: qsTr("Update")
                onClicked: {
                    Api.getFeeds(loaded);
                }
            }
        }
        
        // Tell SilicaFlickable the height of its content.
        contentHeight: childrenRect.height
        
        ListView {
            id: feeds
            anchors.fill: parent
            model: feedsModel
            delegate: Item {
                //width: ListView.view.width
                //height: Theme.itemSizeSmall

                Label { text: feed_title }
            }
        }
        Component.onCompleted: {
            Api.login("jrutila", function() { });
        }
    }
}


