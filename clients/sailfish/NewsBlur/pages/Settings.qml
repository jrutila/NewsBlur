import QtQuick 2.0
import Sailfish.Silica 1.0
import Sailfish.Silica.theme 1.0
import QtQuick.LocalStorage 2.0

Dialog {
    id: settings
    anchors.fill: parent

    Column {
        anchors {
            left: parent.left
            right: parent.right
        }
        PageHeader {
            title: qsTr("NewsBlur Settings")
        }

        SectionHeader {
            text: qsTr("Connection")
        }

        TextField {
            id: username
            width: parent.width
            label: qsTr("Username")
            placeholderText: qsTr("Username")
        }
    }

    onDone: {
        var db = LocalStorage.openDatabaseSync("QQmlNewsBlurDB", "1.0", "Newsblut SQL!", 100000)
        db.transaction( function(tx) {
            tx.executeSql('DELETE FROM Settings');
            tx.executeSql('INSERT INTO Settings VALUES(?)', [ username.text ]);
        })
    }

    function findSettings() {
        var db = LocalStorage.openDatabaseSync("QQmlNewsBlurDB", "1.0", "Newsblut SQL!", 100000)

        db.transaction(
                    function(tx) {
                        tx.executeSql('CREATE TABLE IF NOT EXISTS Settings(username TXT)');
                        var rs = tx.executeSql('SELECT * FROM Settings');
                        if (rs.rows.length == 1)
                            username.text = rs.rows.item(0).username;
                    })
    }
    Component.onCompleted: findSettings()
}





