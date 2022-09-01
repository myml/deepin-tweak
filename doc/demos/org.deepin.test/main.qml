import QtQuick 2.0
import QtQuick.Layouts 1.7
import org.deepin.dtk 1.0
import org.deepin.tweak 1.0

Frame {
    property string displayName: "Test Name"
    property string description: "Test description"
    property string version: "1.0.0"
    property string author: "justforlxz"
    property string icon: "icon.png"

    ColumnLayout {
        Text {
            text: "I'm qml loader content"
        }
        RowLayout {
            Text {
                id: label
                text: "Hello: "
            }
            LineEdit {
            }
            Button {
                id: button
                onClicked: {
                    let vv = Launcher.create().program("ls").arguments("/");
                    console.log("sync =====");
                    let sync = vv.call();
                    console.log("standard output: \n", sync.allStandardOutput);
                    console.log("standard error: \n", sync.allStandardError);
                    console.log('async ======');
                    vv.asyncCall((callback) => {
                      console.log("standard output: \n", callback.allStandardOutput);
                      console.log("standard error: \n", callback.allStandardError);
                    });
                  }
              }
        }
        Image {
            id: img

            source: "tile.png"
            sourceSize.width: 300
            sourceSize.height: 300
        }
    }
}
